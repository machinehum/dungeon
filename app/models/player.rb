class Player < ApplicationRecord
  belongs_to :user
  belongs_to :character_class
  belongs_to :kinship
  has_many :games
  belongs_to :character_status, optional: true
  has_many :game_items
  has_many :items, through: :game_items
  has_one :game_companion

  attribute :parry_armor_modifier, :integer, default: 0

  before_update :health_check
  
  def health_check
    self.health = [self.health,0].max
    if self.health == 0
      self.character_status = CharacterStatus.dead
    end
  end

  def status
    character_status.label
  end

  def dead?
    status == 'dead'
  end

  def move_options
    node.neighbors
  end

  def load_limit
    strength * 3
  end

  def weapon
    game_items.joins(:item).includes(:item).where(equipped: true, item: {weapon: true})&.first
  end

  def armor
    game_items.joins(:item).includes(:item).where(equipped: true, item: {armor: true})&.first
  end

  def class_swing_count
    if ['Druid','Shadewalker','Hunter'].include? character_class.label
      self.level / 5 + 1
    else
      1
    end
  end

  def swing_count
    # Greater of class or weapon count, capped at 10
    [ [class_swing_count, (weapon&.swing_count || 0 ) ].max, 10 ].min
  end

  def class_hit_coefficient
    character_class.hit_coefficient { |divider,bonus| self.level / divider + bonus }
  end

  def hit_coefficient
    if weapon.blank?
      class_hit_coefficient
    else
      weapon.hit_modifier + class_hit_coefficient
    end
  end

  def damage_roll_string
    w = game_items.equipped.joins(:item).where.not(item: {hit_damage: nil})
    if w.blank?
      return 'roll2d2'
    else
      return w.first.item.hit_damage
    end
  end

  def roll_damage
    Dice.send(self.damage_roll_string)
  end

  def roll_initiative
    agility_mod = ( 6 - self.agility ) / 3 
    agility_mod += ( agility_mod < 0 ) ? -1 : 1
    Dice.clip(1,10) { Dice.roll1d10 + agility_mod }
  end

  def attack(opp_armor_class)
    player_hits = []
    hit_rate = self.hit_coefficient + opp_armor_class + 2 
    self.swing_count.times do |n|
      if Dice.percentile5clamped(hit_rate)
        z = self.roll_damage
        puts "Player swing #{n} hits for #{z}"
        player_hits << z
      else
        puts "Player swing #{n} misses"
        player_hits << nil
      end
    end
    return player_hits
  end

  def armor_class
    # Armor modifiers are negative. They get summed and then added to the base 
    Character.armor_class { |base| base + armor_modifiers }
  end

  def armor_modifiers
    game_items.equipped.joins(:item).sum('items.armor_modifier') + parry_armor_modifier
  end

  def current_load
    game_items.equipped.joins(:item).sum('items.weight')
  end



end

class GameNpc < ApplicationRecord
  belongs_to :npc
  
  has_many :npc_dialogues, through: :npc
  belongs_to :game
  belongs_to :character_status, optional: true
  
  has_many :game_encounterables, as: :encounterable

  delegate :label, to: :npc
  delegate :turn_preface, to: :npc
  delegate :turn_options, to: :npc
  delegate :turn_description, to: :npc
  delegate :details, to: :npc
  delegate :picture, to: :npc
  delegate :assertive, to: :npc
  delegate :combatable, to: :npc

  delegate :max_health, to: :npc
  delegate :strength, to: :npc
  delegate :agility, to: :npc
  delegate :intelligence, to: :npc
  delegate :connectedness, to: :npc
  delegate :arcadia, to: :npc
  delegate :luck, to: :npc

  delegate :damage_rolls, to: :npc

  before_update :health_check
  after_update :encounterable_check

  def game_encounterable
    game_encounterables.first
  end

  def status
    character_status.label
  end

  def dead?
    status == 'dead'
  end
  
  def health_check
    self.health = [self.health,0].max
    if self.health == 0
      self.character_status = CharacterStatus.dead
    end
  end

  def encounterable_check
    if status == 'dead'
      game_encounterable.update(active: false)
    end
  end

  def roll_initiative
    Dice.roll1d8 + 1
  end

  def attack(opp_armor_class)
    npc_hits = []
    hit_rate = self.level + opp_armor_class
    self.damage_rolls.each do |n|
      if Dice.percentile5clamped(hit_rate)
        z = Dice.send(n)
        puts "Npc swing #{n} hits for #{z}"
        npc_hits << z
      else
        puts "Npc swing #{n} misses"
        npc_hits << nil
      end
    end
    return npc_hits
  end

  # TODO 
  def armor_class
    8
  end
end

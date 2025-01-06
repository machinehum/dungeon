class Combat < ApplicationRecord
  belongs_to :game
  belongs_to :player
  belongs_to :game_npc

  attribute :player_hits, array: true, default: []
  attribute :npc_hits, array: true, default: []

  after_create :game_encounterable_seen

  def game_encounterable_seen
    game_npc.game_encounterable.update(seen: true)
  end

  def resolve_round(attack: true, parry: false, spell: nil)
    return [] if player.dead? or game_npc.dead?

    @player = player
    parry ? @player.armor_modifier = -2 : nil
    @npc = game_npc
    # (HitCalcMod + MonsterAC + (3*Victim) - 1) * 5%
    # player_hit_rate = ( @player.hit_coefficient + @npc.armor_class + 2 )
    # npc_hit_rate = ( @npc.level + @player.armor_class )
    
    o = round_order
    first = o.first
    second = o.last

    first_hits = first.attack(second.armor_class)

    unless second.health - first_hits.compact.sum <= 0
      second_hits = second.attack(first.armor_class)
    end

    # Character callbacks handle checking for negative and updating status
    if second_hits
      first.update(health: first.health - second_hits.compact.sum)
    end
    second.update(health: second.health - first_hits.compact.sum)

    if first.is_a? Player
      @player_hits = first_hits
      @npc_hits = second_hits
    else 
      @npc_hits = first_hits
      @player_hits = second_hits
    end

    return @player_hits, @npc_hits
  end

  def round_order
    [player, game_npc].sort_by { |s| s.roll_initiative }
  end

  def closeout
    if game_npc.dead? && !player.dead?
      gold = Dice.send("roll#{game_npc.level}d10") + 3
      xp = game_npc.level * 10 + game_npc.npc.health * 20
      player.gold += gold
      player.xp += xp
      player.save
      yield(gold,xp) 
    end
  end

  def run
  
  end



end

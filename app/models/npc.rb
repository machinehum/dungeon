class Npc < ApplicationRecord
  has_many :npc_dialogues, dependent: :destroy
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :game_npcs, dependent: :destroy

  def picture
    pictures&.first
  end

  def turn_description
    "#{label} ... " + description
  end

  def turn_preface
    "What would you like to do?"
  end

  def turn_options
    ['greet','leave','fight']
  end

  def details

  end

  def damage_rolls
    strikes.split(',')
  end

  def self.random_monster
    Npc.new(level: 1, 
            max_health: Dice.roll1d6,
            health: Dice.roll1d6,
            strength: Dice.roll1d6,
            agility: Dice.roll1d6,
            intelligence: Dice.roll1d6,
            connectedness: Dice.roll1d6,
            arcadia: Dice.roll1d6,
            luck: Dice.roll1d6
    )
  end
end

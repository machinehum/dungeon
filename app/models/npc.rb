class Npc < ApplicationRecord
  has_many :character_stats, as: :stattable
  has_many :npc_dialogues
  has_many :pictures, as: :imageable

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
end

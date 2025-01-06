# A place for character-related constants/yields
class Character < ApplicationRecord
  self.abstract_class = true

  def self.armor_class
    yield(10)
  end

  def self.base_stats
    [:vitality, :strength, :agility, :intelligence, :connectedness, :arcadia, :luck]
  end

  def self.stats
    self.base_stats << :health
  end
end

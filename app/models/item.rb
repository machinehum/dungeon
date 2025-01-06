class Item < ApplicationRecord
  belongs_to :npc, optional: true
  has_many :pictures, as: :imageable
  belongs_to :curse, optional: true

  def picture
    pictures&.first
  end

  def turn_description
    "#{label}... #{description}."
  end

  def turn_preface
    "What would you like to do?"
  end

  def turn_options
    ['take','leave','kick']
  end

  def details
    inspection
  end
end

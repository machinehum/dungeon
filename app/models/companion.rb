class Companion < ApplicationRecord
  belongs_to :creature_type
  belongs_to :node, optional: true
  has_many :pictures, as: :imageable
  has_many :icons, as: :iconable

  delegate :health, to: :creature_type
  delegate :strength, to: :creature_type
  delegate :agility, to: :creature_type
  delegate :intelligence, to: :creature_type
  delegate :connectedness, to: :creature_type
  delegate :arcadia, to: :creature_type
  delegate :luck, to: :creature_type

  delegate :label, to: :creature_type
  delegate :description, to: :creature_type

  def picture
    pictures&.first
  end

  def icon
    icons&.first
  end
end

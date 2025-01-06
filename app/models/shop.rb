class Shop < ApplicationRecord
  belongs_to :room
  belongs_to :npc
  has_many :pictures, as: :imageable

  delegate :label, to: :room
  delegate :description, to: :room

  def picture
    pictures&.first
  end

end

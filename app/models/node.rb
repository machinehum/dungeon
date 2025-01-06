class Node < ApplicationRecord
  belongs_to :locatable, polymorphic: true
  has_many :pictures, as: :imageable

  has_many :portals
  has_many :edges, through: :portals
  has_many :nodes, through: :edges

  delegate :description, to: :locatable
  delegate :label, to: :locatable

  def neighbors
    nodes.where.not(id: self.id)
  end

  def picture
    pictures&.first
  end

  def turn_description
    "You see " + description
  end

  def turn_preface
    "There are #{portals.count} ways to go from here."
  end

  def turn_options
    portals
  end

end

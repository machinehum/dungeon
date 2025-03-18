##
# This class represents a Node in our game map's graph of nodes and edges. 
# Nodes and Edges are not directly connected -- see the "Portal" class for details.

class Node < ApplicationRecord
  belongs_to :locatable, polymorphic: true
  has_many :pictures, as: :imageable

  has_many :portals
  has_many :edges, through: :portals
  has_many :nodes, through: :edges

  delegate :description, to: :locatable
  delegate :label, to: :locatable

  ##
  # Returns all connected nodes by finding all related edges, finding the 
  # nodes of all those edges, and filtering itself out of that list of nodes.

  def neighbors
    nodes.where.not(id: self.id)
  end

  ##
  # Returns the filename of an associated image.

  def picture
    pictures&.first
  end

  ## 
  # Returns a description for the user when they "enter" this node.

  def turn_description
    "You see " + description
  end

  ##
  # Returns a preface for the turn options. The base case is a simple
  # count of the possible way to go from this node -- other mechanics 
  # can override this. 

  def turn_preface
    "There are #{portals.count} ways to go from here."
  end

  ##
  # Returns a list of the turn options. The base case is a simple
  # list of the possible ways to go from this node, i.e., the associated 
  # portals -- other mechanics can override this.

  def turn_options
    portals
  end

end

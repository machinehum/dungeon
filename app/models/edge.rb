##
# This class represents an edge connecting two nodes. In game play,
# an edge may represent a hallway, footpath, etc. It is not a place
# the player can "be" (that is a node), but a connection between 
# nodes. It defines possibilities for navigation, and is a hook for 
# descriptions for player experience (e.g. 
# Edge.create(description: "a pebbly path leading into the distance"))

##
# Edges and nodes are not directly connected -- an intersection entity
# "Portal" belongs to exactly one Edge and one Node. See the Portal model
# for more details.

class Edge < ApplicationRecord
  has_many :portals
  has_many :nodes, through: :portals

  ##
  # Given one node (the "origin"), returns the other
  # node of the edge. 
  #
  # TODO: implement mechanics of the "weight" attribute, which will 
  # correspond to e.g. distance/time that it takes to traverse the edge. 

  def traverse(origin)
    self.nodes.where.not(id: origin.id).first
  end 
end

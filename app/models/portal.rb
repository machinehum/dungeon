##
# This class describes the intersection entity which connects exactly one
# Node with one Edge. This has no significance in the logical graph that is
# the game map, consisting of nodes and edges; it is used for player experience
# and extended mechanics. It can capture a description of an opening (is it
# a door, an open break in a wall, a gate, a window; is it blue, metal, wooden, mysterious...). 
# It can also capture e.g. whether a door is "locked", which in implementation would mean 
# that the associated edge is not traversable without the proper key.

class Portal < ApplicationRecord
  belongs_to :node
  belongs_to :edge
  belongs_to :node_group_passage, optional: true, class_name: "NodeGroup"

  ##
  # Given a current node, e.g. a player's current location, return the node
  # that lies through this "Portal" at the other end of the associated Edge. 
  
  def go
    edge.traverse(node)
  end
end

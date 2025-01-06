class Portal < ApplicationRecord
  belongs_to :node
  belongs_to :edge
  belongs_to :node_group_passage, optional: true, class_name: "NodeGroup"

  def go
    edge.traverse(node)
  end
end

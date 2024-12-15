class Portal < ApplicationRecord
  belongs_to :node
  belongs_to :edge

  def go
    edge.traverse(node)
  end
end

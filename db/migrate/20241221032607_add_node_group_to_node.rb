class AddNodeGroupToNode < ActiveRecord::Migration[8.0]
  def change
    add_reference :nodes, :node_group, foreign_key: true
  end
end

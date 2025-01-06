class AddNodeGroupToPortal < ActiveRecord::Migration[8.0]
  def change
    add_reference :portals, :node_group, foreign_key: true
  end
end

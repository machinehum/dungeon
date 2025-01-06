class CreateNodeGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :node_groups do |t|
      t.string :label
      t.text :description

      t.timestamps
    end
  end
end

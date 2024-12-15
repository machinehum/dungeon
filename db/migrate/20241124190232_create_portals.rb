class CreatePortals < ActiveRecord::Migration[8.0]
  def change
    create_table :portals do |t|
      t.references :node, null: false, foreign_key: true
      t.references :edge, null: false, foreign_key: true
      t.string :label
      t.text :description

      t.timestamps
    end
  end
end

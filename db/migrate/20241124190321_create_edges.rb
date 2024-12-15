class CreateEdges < ActiveRecord::Migration[8.0]
  def change
    create_table :edges do |t|
      t.string :label
      t.text :description
      t.float :weight
      t.boolean :directed

      t.timestamps
    end
  end
end

class CreateDoors < ActiveRecord::Migration[8.0]
  def change
    create_table :doors do |t|
      t.references :portal, null: false, foreign_key: true
      t.boolean :locked
      t.text :description
      t.boolean :window

      t.timestamps
    end
  end
end

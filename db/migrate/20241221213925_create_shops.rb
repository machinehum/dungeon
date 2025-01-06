class CreateShops < ActiveRecord::Migration[8.0]
  def change
    create_table :shops do |t|
      t.references :room, null: false, foreign_key: true
      t.references :npc, null: false, foreign_key: true

      t.timestamps
    end
  end
end

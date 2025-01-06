class CreateGameShops < ActiveRecord::Migration[8.0]
  def change
    create_table :game_shops do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.references :game_npc, null: false, foreign_key: true

      t.timestamps
    end
  end
end

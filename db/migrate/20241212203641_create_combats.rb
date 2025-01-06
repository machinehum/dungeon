class CreateCombats < ActiveRecord::Migration[8.0]
  def change
    create_table :combats do |t|
      t.references :game, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.references :game_npc, null: false, foreign_key: true
      t.integer :player_damage
      t.integer :npc_damage
      t.boolean :resolved

      t.timestamps
    end
  end
end

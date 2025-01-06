class CreateGameCompanions < ActiveRecord::Migration[8.0]
  def change
    create_table :game_companions do |t|
      t.references :player, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.references :companion, null: false, foreign_key: true
      t.references :game_node, foreign_key: true
      t.references :game_npc, foreign_key: true
      t.integer :max_health
      t.integer :health
      t.integer :strength
      t.integer :agility
      t.integer :intelligence
      t.integer :connectedness
      t.integer :arcadia
      t.integer :luck

      t.timestamps
    end
  end
end

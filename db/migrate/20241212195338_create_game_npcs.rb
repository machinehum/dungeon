class CreateGameNpcs < ActiveRecord::Migration[8.0]
  def change
    create_table :game_npcs do |t|
      t.references :npc, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateGameEncounterables < ActiveRecord::Migration[8.0]
  def change
    create_table :game_encounterables do |t|
      t.references :game, null: false, foreign_key: true
      t.references :encounterable, polymorphic: true, null: false
      t.references :game_node, foreign_key: true
      t.boolean :seen, default: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

class CreateGameNodes < ActiveRecord::Migration[8.0]
  def change
    create_table :game_nodes do |t|
      t.references :game, null: false, foreign_key: true
      t.references :node, null: false, foreign_key: true
      t.boolean :visited, null: false, default: false

      t.timestamps
    end
  end
end

class CreateGameItems < ActiveRecord::Migration[8.0]
  def change
    create_table :game_items do |t|
      t.references :game, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :player, foreign_key: true
      t.references :node, foreign_key: true
      t.boolean :equipped, null: false, default: false

      t.timestamps
    end
  end
end

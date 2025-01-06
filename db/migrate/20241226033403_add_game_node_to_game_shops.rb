class AddGameNodeToGameShops < ActiveRecord::Migration[8.0]
  def change
    add_reference :game_shops, :game_node, foreign_key: true
  end
end

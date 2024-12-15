class AddGameNodeToGames < ActiveRecord::Migration[8.0]
  def change
    add_reference :games, :game_node, foreign_key: true
  end
end

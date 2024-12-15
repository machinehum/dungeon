class RemoveNodeFromGames < ActiveRecord::Migration[8.0]
  def change
    remove_reference :games, :node, null: false, foreign_key: true
  end
end

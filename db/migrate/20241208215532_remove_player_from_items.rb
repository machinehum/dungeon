class RemovePlayerFromItems < ActiveRecord::Migration[8.0]
  def change
    remove_reference :items, :player, foreign_key: true
  end
end

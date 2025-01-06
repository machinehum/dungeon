class AddUserToPlayers < ActiveRecord::Migration[8.0]
  def change
    add_reference :players, :user, foreign_key: true
  end
end

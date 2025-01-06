class AddStatusToPlayer < ActiveRecord::Migration[8.0]
  def change
    add_reference :players, :character_status, default: 1, foreign_key: true
  end
end

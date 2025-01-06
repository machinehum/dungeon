class AddHealthToGameNpc < ActiveRecord::Migration[8.0]
  def change
    add_column :game_npcs, :health, :integer, default: 1
  end
end

class AddLevelToGameNpc < ActiveRecord::Migration[8.0]
  def change
    add_column :game_npcs, :level, :integer, default: 1
  end
end

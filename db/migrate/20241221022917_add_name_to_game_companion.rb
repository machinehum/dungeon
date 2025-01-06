class AddNameToGameCompanion < ActiveRecord::Migration[8.0]
  def change
    add_column :game_companions, :name, :string
  end
end

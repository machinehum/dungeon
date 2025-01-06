class AddStandaloneToRooms < ActiveRecord::Migration[8.0]
  def change
    add_column :rooms, :standalone, :boolean, default: false
  end
end

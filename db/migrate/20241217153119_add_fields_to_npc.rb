class AddFieldsToNpc < ActiveRecord::Migration[8.0]
  def change
    add_column :npcs, :max_health, :integer
    add_column :npcs, :health, :integer
    add_column :npcs, :strength, :integer
    add_column :npcs, :agility, :integer
    add_column :npcs, :intelligence, :integer
    add_column :npcs, :connectedness, :integer
    add_column :npcs, :arcadia, :integer
    add_column :npcs, :luck, :integer
    add_column :npcs, :level, :integer
  end
end

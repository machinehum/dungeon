class AddFieldsToPlayer < ActiveRecord::Migration[8.0]
  def change
    add_column :players, :max_health, :integer
    add_column :players, :health, :integer
    add_column :players, :strength, :integer
    add_column :players, :agility, :integer
    add_column :players, :intelligence, :integer
    add_column :players, :connectedness, :integer
    add_column :players, :arcadia, :integer
    add_column :players, :luck, :integer
    add_column :players, :level, :integer
  end
end

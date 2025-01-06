class AddFieldsToCharacterClass < ActiveRecord::Migration[8.0]
  def change
    add_column :character_classes, :hit_coefficient_divisor, :integer
    add_column :character_classes, :hit_coefficient_bonus, :integer
  end
end

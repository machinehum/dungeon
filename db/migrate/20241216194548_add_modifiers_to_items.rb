class AddModifiersToItems < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :armor_modifier, :integer
    add_column :items, :hit_modifier, :integer
    add_column :items, :spell_modifier, :integer
    add_reference :items, :curse, foreign_key: true
    add_column :items, :swing_count, :integer
    add_column :items, :hit_damage, :string
  end
end

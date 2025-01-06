class AddTypesToItem < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :weapon, :boolean, default: false
    add_column :items, :armor, :boolean, default: false
    add_column :items, :wand, :boolean, default: false
  end
end

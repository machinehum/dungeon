class AddInspectionToItem < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :inspection, :text
  end
end

class AddAssertiveToNpcs < ActiveRecord::Migration[8.0]
  def change
    add_column :npcs, :assertive, :boolean
  end
end

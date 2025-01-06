class AddStrikesToNpc < ActiveRecord::Migration[8.0]
  def change
    add_column :npcs, :strikes, :string
  end
end

class AddXpToPlayer < ActiveRecord::Migration[8.0]
  def change
    add_column :players, :xp, :integer, default: 0
  end
end

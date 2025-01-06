class AddGoldToPlayer < ActiveRecord::Migration[8.0]
  def change
    add_column :players, :gold, :integer, default: 0
  end
end

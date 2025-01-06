class CreateShopInventories < ActiveRecord::Migration[8.0]
  def change
    create_table :shop_inventories do |t|
      t.references :game_shop, null: false, foreign_key: true
      t.references :game_item, foreign_key: true
      t.references :game_companion, foreign_key: true
      t.integer :price
      t.integer :stock
      t.integer :buy_price

      t.timestamps
    end
  end
end

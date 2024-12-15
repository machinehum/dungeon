class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.string :name
      t.references :character_class, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end

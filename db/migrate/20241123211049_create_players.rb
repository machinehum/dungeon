class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.string :name
      t.references :character_class, null: false, foreign_key: true
      t.references :kinship, null: false, foreign_key: true
      t.text :description
      t.integer :max_health
      t.integer :health
      t.integer :strength
      t.integer :agility
      t.integer :intelligence
      t.integer :connectedness
      t.integer :arcadia
      t.integer :luck

      t.timestamps
    end
  end
end

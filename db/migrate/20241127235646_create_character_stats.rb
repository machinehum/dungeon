class CreateCharacterStats < ActiveRecord::Migration[8.0]
  def change
    create_table :character_stats do |t|
      t.references :stattable, polymorphic: true, null: false
      t.integer :health
      t.integer :strength
      t.integer :speed
      t.integer :bravery
      t.integer :cunning
      t.integer :healing
      t.integer :knowledge
      t.integer :connectedness
      t.integer :arcadia
      t.integer :load_limit

      t.timestamps
    end
  end
end

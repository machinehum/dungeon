class CreateCharacterClasses < ActiveRecord::Migration[8.0]
  def change
    create_table :character_classes do |t|
      t.string :label
      t.text :description

      t.timestamps
    end
  end
end

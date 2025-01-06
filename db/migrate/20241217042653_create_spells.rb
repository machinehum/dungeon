class CreateSpells < ActiveRecord::Migration[8.0]
  def change
    create_table :spells do |t|
      t.string :label
      t.text :description
      t.string :effect

      t.timestamps
    end
  end
end

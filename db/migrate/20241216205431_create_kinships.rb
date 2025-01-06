class CreateKinships < ActiveRecord::Migration[8.0]
  def change
    create_table :kinships do |t|
      t.string :label
      t.text :description
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

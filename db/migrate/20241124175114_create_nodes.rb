class CreateNodes < ActiveRecord::Migration[8.0]
  def change
    create_table :nodes do |t|
      t.string :label
      t.text :description
      t.references :locatable, polymorphic: true, null: false

      t.timestamps
    end
  end
end

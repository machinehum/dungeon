class CreateTerras < ActiveRecord::Migration[8.0]
  def change
    create_table :terras do |t|
      t.string :label
      t.text :description

      t.timestamps
    end
  end
end

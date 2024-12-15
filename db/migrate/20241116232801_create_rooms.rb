class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.text :label
      t.string :description
      t.boolean :outdoor
      # t.references :map, foreign_key: true

      t.timestamps
    end
  end
end

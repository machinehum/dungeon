class CreateKeys < ActiveRecord::Migration[8.0]
  def change
    create_table :keys do |t|
      t.references :door, null: false, foreign_key: true
      t.text :description
      t.boolean :working

      t.timestamps
    end
  end
end

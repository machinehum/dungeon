class CreateIcons < ActiveRecord::Migration[8.0]
  def change
    create_table :icons do |t|
      t.string :filename
      t.references :iconable, polymorphic: true, null: false

      t.timestamps
    end
  end
end

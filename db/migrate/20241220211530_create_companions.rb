class CreateCompanions < ActiveRecord::Migration[8.0]
  def change
    create_table :companions do |t|
      t.references :creature_type, null: false, foreign_key: true
      t.string :name
      t.references :node, null: false, foreign_key: true

      t.timestamps
    end
  end
end

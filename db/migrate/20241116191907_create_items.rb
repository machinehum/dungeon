class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.references :player, foreign_key: true
      t.references :npc, foreign_key: true
      t.boolean :equipable
      t.integer :weight
      t.boolean :packable
      t.string :label
      t.text :description
      t.boolean :working

      t.timestamps
    end
  end
end

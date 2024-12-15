class CreateCharacterStatMods < ActiveRecord::Migration[8.0]
  def change
    create_table :character_stat_mods do |t|
      t.references :character_stats, null: false, foreign_key: true
      t.string :stat_attribute
      t.integer :modifier
      t.datetime :expires

      t.timestamps
    end
  end
end

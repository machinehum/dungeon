class CreateCharacterStatuses < ActiveRecord::Migration[8.0]
  def change
    create_table :character_statuses do |t|
      t.string :label
      t.integer :turn_count

      t.timestamps
    end
  end
end

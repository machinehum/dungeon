class CreateNpcDialogues < ActiveRecord::Migration[8.0]
  def change
    create_table :npc_dialogues do |t|
      t.references :npc, null: false, foreign_key: true
      t.references :npc_responses, foreign_key: true
      t.text :dialogue
      t.boolean :initial, default: true
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end

class CreateNpcResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :npc_responses do |t|
      t.references :npc_dialogue, null: false, foreign_key: true
      t.references :next_dialogue, null: false, foreign_key: { to_table: :npc_dialogues}
      t.text :response_text
      t.text :effects

      t.timestamps
    end
  end
end

class NpcResponse < ApplicationRecord
  belongs_to :npc_dialogue
  belongs_to :next_dialogue, class_name: "NpcDialogue"
end

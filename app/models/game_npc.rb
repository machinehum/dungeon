class GameNpc < ApplicationRecord
  belongs_to :npc
  has_many :npc_dialogues, through: :npc
  belongs_to :game
  
  has_many :game_encounterables, as: :encounterable

  delegate :label, to: :npc
  delegate :turn_preface, to: :npc
  delegate :turn_options, to: :npc
  delegate :turn_description, to: :npc
  delegate :details, to: :npc
  delegate :picture, to: :npc
  delegate :assertive, to: :npc
  delegate :combatable, to: :npc


end

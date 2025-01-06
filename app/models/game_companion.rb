class GameCompanion < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :game
  belongs_to :companion
  belongs_to :game_node, optional: true
  belongs_to :game_npc, optional: true

  has_many :game_encounterables, as: :encounterable

  delegate :picture, to: :companion
  delegate :icon, to: :companion
  delegate :label, to: :companion
  delegate :description, to: :companion
  
  def take_verb
    "Adopt"
  end
  
  # TODO: add a second division of stats beyond fundamentals. 
  
end

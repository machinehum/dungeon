class Combat < ApplicationRecord
  belongs_to :game
  belongs_to :player
  belongs_to :game_npc

  enum :initiative, [ :player, :npc ]

  def begin_round
    
  end

  def complete_round
  
  end

  def 
end

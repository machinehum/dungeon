class CombatController < ApplicationController
  before_action :get_resources

  def create
    @combat = Combat.new(
      player: @player,
      game_npc_id: params[:npc_id]
    )
    if @combat.save
      redirect_to @combat
    else
      abort("oh no")
    end
  end

  def show

  end

  def update
    # if params[:parry]
    #   (@player_hits, @npc_hits) = @combat.resolve_round(attack: false, parry: true, spell: nil)
    # elsif params[:spell]
    #   (@player_hits, @npc_hits) = @combat.resolve_round(attack: false, parry: false, spell: params[:spell])
    # else
      @player_hits, @npc_hits = @combat.resolve_round(attack:true, parry: false, spell: nil)
      if @player.dead? || @game_npc.dead? 
        @combat.closeout { |gold,xp| flash.notice = "You have earned #{gold} gold and #{xp} XP."}
      end
    # end
  end

  def run

  end

  private

  def get_resources
    @game = Game.find(params[:game_id])
    @player = @game.player
    if params[:id]
      @combat = Combat.find(params[:id])
      @game_npc = @combat.game_npc
      @picture = @game_npc.picture
    end
  end
end

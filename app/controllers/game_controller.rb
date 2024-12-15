class GameController < ApplicationController
  before_action :get_game

  def index

  end

  def show
    if @game.combative_npc?
      @combat = Combat.find_or_create_by(game: @game, player: @game.player, game_npc: @game.combative_npc, resolved: false)
      redirect_to([@game, @combat])
    end

    @turn_preface = @game.turn_preface
    @turn_options = @game.turn_options
    @turn_description = @game.turn_description
  end

  def move
  	portal = Portal.find(game_params[:portal])
  	if @game.move(portal)
      respond_to do |format|
        format.html { redirect_to @game }
        # format.turbo_stream
      end
  	else
  	  abort("oh no")
  	end
  end

private

  def game_params
    params.expect(game: [:portal])
  end  

  def get_game
  	id = params[:id] || params[:game_id]
  	@game = Game.find(id)
  	@node = @game.node
  	@player = @game.player
  end
end

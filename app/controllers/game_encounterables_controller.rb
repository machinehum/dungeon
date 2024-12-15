class GameEncounterablesController < ApplicationController
  before_action :get_resources

  def index
    if params[:observable]
      @encounterables = @game.observables
    else
      @encounterables = @game.game_encounterables
    end
    @turn_preface = @game.turn_preface
    @turn_options = @game.turn_options
    @turn_description = @game.turn_description
  end

  def show
    @turn_preface = @game_encounterable.turn_preface
    @turn_options = @game_encounterable.turn_options
    @turn_description = @game_encounterable.turn_description
  end

  def update
    respond_to do |format|
      if @game_encounterable.update game_encounterable_params
        format.html { redirect_to @game }
      end
    end
  end

  private 

  def game_encounterable_params
    params.expect(game_encounterable: [:seen, :take])
  end  

  def get_resources
    @game = Game.find(params[:game_id])
    if params[:id]
      @game_encounterable = @encounterable = GameEncounterable.find(params[:id])
    end
  end
end

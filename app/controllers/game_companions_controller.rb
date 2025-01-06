class GameCompanionsController < ApplicationController
  before_action :get_resources

  def show
    
  end

  private

  def get_resources
    @game = Game.find(params[:game_id])
    if params[:id]
      @game_companion = GameCompanion.find(params[:id])
    end
  end
end

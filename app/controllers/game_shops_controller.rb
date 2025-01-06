class GameShopsController < ApplicationController
  before_action :get_resources

  def index

  end

  def show
    @turn_preface = @game_shop.turn_preface
    @turn_description = @game_shop.turn_description
  end

private

  def game_params
    params.expect(game: [:portal])
  end  

  def get_resources
    @game = Game.find(params[:game_id])
    @game_shop = GameShop.find(params[:id])
    @player = @game.player
  end
end

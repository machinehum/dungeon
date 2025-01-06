class RoomsController < ApplicationController
  before_action :get_resources

  def show
    if @game_shop
      redirect_to [@game, @game_shop]
    end
  end

private

  def get_resources
    @game = Game.find(params[:game_id])
    @room = Room.find(params[:id])
    if @room.shop
      @game_shop = GameShop.find_by(game_id: @game.id, shop_id: @room.shop.id)
    end
  end
end

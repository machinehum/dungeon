class ShopInventoryController < ApplicationController
  before_action :get_resources

  def index
    @inventory = ShopInventory.where(game_shop: @game_shop, stock: [1..])
  end

  def show
    
  end

  def update
    if params[:outgoing]
      @shop_item.transaction do
        @shop_item.update!(stock: @shop_item.stock - 1)
        @shop_item.thing.update!(player: @player)
        @player.update!(gold: @player.gold - @shop_item.price)
      end
    end
    flash.notice = "You nabbed it!" 
    redirect_to [@game, @game_shop]
  rescue ActiveRecord::RecordInvalid => exception
    abort("getting a thing from the shop caused a fatal: #{exception.to_json}")
  end

  private

  def get_resources
    @game = Game.find(params[:game_id])
    @game_shop = GameShop.find(params[:game_shop_id])
    @player = @game.player
    if params[:id]
      @shop_item = ShopInventory.find(params[:id])
    end
  end

end

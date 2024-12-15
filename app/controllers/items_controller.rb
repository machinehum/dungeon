class ItemsController < ApplicationController
  before_action :get_resources

  def show
    abort(@item.to_json)
  end

private

  def get_resources
    @item = Item.find(params[:id])
    @game = Game.find(params[:game_id])
  end
end

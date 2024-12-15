class GameItemsController < ApplicationController
  before_action :get_resources

  def index
    # We have no use case to display a full list of items (probably), so we're going to use
    # the index method to show the player's inventory without introducing a custom action/route.
    @equipped_items = GameItem.where(player: @game.player, equipped: true)
    @packed_items = GameItem.where(player: @game.player, equipped: false)
  end

  def show
    abort(@item.to_json)
  end

  def create
    @game_item = GameItem.new(game_item_params)
    respond_to do |format|
      if @game_item.save!
        format.html { redirect_to @game }
        format.turbo_stream { render "index" }
      else
        abort("oh no")
      end
    end
  end

  def update
    respond_to do |format|
      if @game_item.update game_item_params
        flash_this_update
        @equipped_items = GameItem.where(player: @game.player, equipped: true)
        @packed_items = GameItem.where(player: @game.player, equipped: false)
        format.html { redirect_to game_game_items_path }
        format.turbo_stream { render "index" }
      end
    end
  end

  private 

  def game_item_params
    params.expect(game_item: [:game_id, :player_id, :item_id, :game_node_id, :equipped, ])
  end  

  def get_resources
    @game = Game.find(params[:game_id])
    if params[:id]
      @game_item = GameItem.find(params[:id])
    end
  end

  def flash_this_update
    if @game_item.equipped_previous_change == [false,true]
      flash.notice = "You equipped the \"#{@game_item.item.label}\""
      @was_equipped = @game_item.id
    elsif @game_item.equipped_previous_change == [true,false] && @game_item.player_id != nil
      flash.notice = "You stowed the \"#{@game_item.item.label}\""
      @was_stowed = @game_item.id
    elsif @game_item.player_id_previous_change == [nil,@game.player.id]
      flash.notice = "You picked up the \"#{@game_item.item.label}\""
    elsif @game_item.player_id_previous_change == [@game.player.id,nil]
      flash.notice = "You dropped the \"#{@game_item.item.label}\""
    end
  end
end

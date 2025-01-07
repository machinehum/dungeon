class PlayersController < ApplicationController

  def show
    @player = Player.find(params[:id])
  end

  def new
  	@player = Player.new
  end

  def create
  	respond_to do |format|  
      if @player = Player.create! player_params.merge(user_id: Current.user.id)
        format.html { redirect_to roll_player_path(@player) }
      end
    end
  end

  def edit

  end

  def update

  end

  def roll
    @player = Player.find(params[:id])
    @points_available = session[:last_stat_roll] = Dice.roll_stats
  end

  def roll_save
    @player = Player.find(params[:id])

    # TODO Confirm assigned points match roll


    respond_to do |format|
      if @player.update! player_params
        format.html { redirect_to @player.games.create! }
      end
    end
  end

  private

  def player_params
    params.expect(player: [:name, :description, :character_class_id, :kinship_id, :vitality, :strength, :agility, :intelligence, :connectedness, :arcadia, :luck])
  end  
end

class CombatController < ApplicationController
  before_action :get_resources

  def show

  end

  def update

  end

  private

  def get_resources
    @game = Game.find(params[:game_id])
    if params[:id]
      @combat = Combat.find(params[:id])
    end
  end
end

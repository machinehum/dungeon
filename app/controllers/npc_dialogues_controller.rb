class NpcDialoguesController < ApplicationController
  before_action :get_resources

  def index

  end

  def show
    @talk_text = @dialogue.dialogue
    @turn_preface = "How would you like to respond?"
    @turn_description = "\"#{@talk_text}\""
    @turn_options = NpcResponse.where(npc_dialogue: @dialogue)
  end

  private

  def get_resources
    @dialogue = NpcDialogue.find(params[:id])
    @npc = @dialogue.npc
    @game = Game.find(params[:game_id])
    @game_npc = GameNpc.find_by(game_id: @game.id, npc_id: @npc.id)
    @game_encounterable = GameEncounterable.find_by(game_id: @game.id, encounterable_type: 'GameNpc', encounterable_id: @game_npc.id)
  end
end

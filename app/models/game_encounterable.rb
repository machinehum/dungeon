class GameEncounterable < ApplicationRecord
  belongs_to :game
  belongs_to :encounterable, polymorphic: true
  belongs_to :game_node

  delegate :turn_preface, to: :encounterable
  delegate :turn_options, to: :encounterable
  delegate :turn_description, to: :encounterable
  delegate :details, to: :encounterable
  delegate :label, to: :encounterable
  delegate :picture, to: :encounterable

  def class_name
    self.encounterable.class.name.underscore
  end

  def assertive 
    return nil unless encounterable.respond_to?('assertive')
    encounterable.assertive
  end

  def dialogue
    return nil unless encounterable.respond_to?('npc_dialogues')
    if encounterable.npc_dialogues.count == 1
      encounterable.npc_dialogues.first.dialogue
    elsif seen
      encounterable.npc_dialogues.where(initial: false).first
    else
      encounterable.npc_dialogues.where(initial: true).first
    end
  end

end

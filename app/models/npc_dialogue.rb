class NpcDialogue < ApplicationRecord
  belongs_to :npc
  has_many :npc_responses, dependent: :destroy

  def class_name
    self.class.name.underscore.pluralize
  end

  def turn_description
    "#{label} talks at you... " + description
  end

  def turn_preface
    "Respond?"
  end

  def turn_options
    ['talk more','leave']
  end
end

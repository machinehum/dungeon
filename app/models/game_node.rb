class GameNode < ApplicationRecord
  belongs_to :game
  belongs_to :node
  has_one :room, through: :node, source: :locatable, source_type: "Room"

  has_one :game_shop

  has_many :game_encounterables
  has_many :observables, -> { where(active: true) }, class_name: "GameEncounterable"

  delegate :turn_preface, to: :node
  delegate :turn_options, to: :node
  delegate :turn_description, to: :node
  delegate :picture, to: :node

  def standalone?
    room&.standalone.blank? ? false : true
  end

end

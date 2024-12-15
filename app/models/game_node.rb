class GameNode < ApplicationRecord
  belongs_to :game
  belongs_to :node

  has_many :game_encounterables
  has_many :observables, -> { where(active: true) }, class_name: "GameEncounterable"

  delegate :turn_preface, to: :node
  delegate :turn_options, to: :node
  delegate :turn_description, to: :node
  delegate :picture, to: :node
end

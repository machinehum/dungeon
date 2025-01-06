class GameItem < ApplicationRecord
  belongs_to :game
  belongs_to :item
  has_one :curse, through: :item
  belongs_to :player, optional: true
  belongs_to :game_node, optional: true

  has_many :game_encounterables, as: :encounterable

  delegate :label, to: :item
  delegate :description, to: :item
  delegate :turn_preface, to: :item
  delegate :turn_options, to: :item
  delegate :turn_description, to: :item
  delegate :details, to: :item
  delegate :picture, to: :item
  delegate :weight, to: :item

  delegate :armor_modifier, to: :item
  delegate :hit_modifier, to: :item
  delegate :spell_modifier, to: :item
  delegate :swing_count, to: :item
  delegate :hit_damage, to: :item

  before_update :encounterable_availability

  scope :equipped, -> { where(equipped: true) }

  private

  def encounterable_availability
    if player_id_change
      if player_id_change.first == nil && player_id_change.last != nil 
        ge = GameEncounterable.find_by(game_id: self.game_id, encounterable_type: 'GameItem', encounterable_id: self.id)
        if ge && ge.active == true
          ge.update(active: false)
        end
      end
      if player_id_change.first != nil && player_id_change.last == nil         
        ge = GameEncounterable.find_by(game_id: self.game_id, encounterable_type: 'GameItem', encounterable_id: self.id)
        if ge && ge.active == false
          ge.update(game_node_id: game.game_node_id, active: true)
        end
      end
    end
  end
end

class GameShop < ApplicationRecord
  belongs_to :shop
  belongs_to :game
  belongs_to :game_node
  belongs_to :game_npc
  has_many :shop_inventories

  delegate :label, to: :shop
  delegate :description, to: :shop
  delegate :picture, to: :shop

  def turn_preface
    "You can ..."
  end

  def turn_description
    "Welcome to <strong>".html_safe + label + '</strong>, '.html_safe + description  + "."
  end
end

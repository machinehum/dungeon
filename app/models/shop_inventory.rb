class ShopInventory < ApplicationRecord
  belongs_to :game_shop
  belongs_to :game_item, optional: true
  belongs_to :game_companion, optional: true

  def picture
    thing.picture
  end

  def thing
    game_item || game_companion
  end

  def thing_klass
    thing.class.name
  end

  def label
    thing.label
  end

  def description
    thing.description
  end

  def take_verb
    thing.take_verb
  end
end

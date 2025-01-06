class Game < ApplicationRecord
  belongs_to :player
  has_many :game_nodes
  belongs_to :game_node, optional: true
  has_one :node, through: :game_node
  has_many :game_encounterables
  has_many :observables, through: :game_node

  accepts_nested_attributes_for :game_encounterables

  def shop?
    if game_node && game_node.game_shop
      return true
    else
      return false
    end
  end
  
  def shop
    if game_node
      return game_node.game_shop
    else
      return nil
    end
  end 

  def npc?
    if game_node
      e = observables.where(encounterable_type: 'GameNpc', active: true).exists?
      return e
    else
      return false
    end
  end

  def npc
    if game_node
      e = observables.where(encounterable_type: 'GameNpc', active: true)
      return e&.first&.encounterable
    else
      return nil
    end
  end

  def assertive_npc?
    if game_node
      e = observables.includes(:encounterable).where(encounterable_type: 'GameNpc', active: true, seen: false)
      return e.select { |e| e.encounterable.assertive == true }.count > 0
    else
      return false
    end
  end

  def assertive_npc
    if game_node
      e = observables.includes(:encounterable).where(encounterable_type: 'GameNpc', active: true, seen: false)
      return e.select { |e| e.encounterable.assertive == true }&.first
    else
      return nil
    end
  end

  def combative_npc
    if game_node
      e = observables.includes(:encounterable).where(encounterable_type: 'GameNpc', active: true)
      return e.select { |e| e.encounterable.assertive == true && e.encounterable.combatable == true}&.first&.encounterable
    else
      return nil
    end
  end

  def combative_npc?
    combative_npc == nil ? false : true
  end

  def turn_object
    assertive_npc || game_node
  end

  def turn_object_class_name
    turn_object.class.name.underscore
  end

  def turn_preface
    turn_object.turn_preface
  end

  def turn_description
    turn_object.turn_description
  end

  def turn_options
    turn_object.turn_options
  end

  def image

  end

  def move(portal)
    unless turn_options.include?(portal)
      return false
    else
      self.game_node = GameNode.find_or_create_by(game: self, node: portal.go)
      if self.save
        return true
      else
        raise "on no"
      end
    end
  end

end

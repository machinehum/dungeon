class Room < ApplicationRecord
  has_many :nodes, as: :locatable
  has_one :shop 

  def node
    nodes.first
  end
  
end
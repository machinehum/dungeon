class Edge < ApplicationRecord
  has_many :portals
  has_many :nodes, through: :portals

  def traverse(origin)
    self.nodes.where.not(id: origin.id).first
  end 
end

class Player < ApplicationRecord
  belongs_to :character_class, optional: true
  has_many :character_stats, as: :stattable

  has_many :games

  def move_options
    node.neighbors
  end
end

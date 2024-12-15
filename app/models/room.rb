class Room < ApplicationRecord
  has_many :nodes, as: :locatable
end
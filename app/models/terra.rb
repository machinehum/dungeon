class Terra < ApplicationRecord
  has_many :nodes, as: :locatable
end

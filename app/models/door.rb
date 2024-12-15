class Door < ApplicationRecord
  belongs_to :portal
  belongs_to :one_way_id
end

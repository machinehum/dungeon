class Session < ApplicationRecord
  belongs_to :user
  has_one :player, through: :user
end

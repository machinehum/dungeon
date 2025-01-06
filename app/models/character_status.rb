class CharacterStatus < ApplicationRecord
  scope :dead, -> { where(label: 'dead').first }
end

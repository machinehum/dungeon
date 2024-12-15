class CharacterStat < ApplicationRecord
  belongs_to :stattable, polymorphic: true
end

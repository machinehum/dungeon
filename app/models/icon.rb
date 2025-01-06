class Icon < ApplicationRecord
  belongs_to :iconable, polymorphic: true
end

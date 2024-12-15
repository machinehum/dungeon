class NodeEncounterable < ApplicationRecord
  belongs_to :node
  belongs_to :encounterable, polymorphic: true
end

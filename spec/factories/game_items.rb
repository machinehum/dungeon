FactoryBot.define do
  factory :game_item do
    player { nil }
    item { nil }
    equipped { false }
    node { nil }
  end
end

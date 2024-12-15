FactoryBot.define do
  factory :game_encounterable do
    game { nil }
    encounterable { nil }
    node { nil }
    seen { false }
  end
end

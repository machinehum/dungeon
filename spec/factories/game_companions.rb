FactoryBot.define do
  factory :game_companion do
    player { nil }
    game { nil }
    companion { nil }
    game_node { nil }
    game_npc { nil }
    max_health { 1 }
    health { 1 }
    strength { 1 }
    agility { 1 }
    intelligence { 1 }
    connectedness { 1 }
    arcadia { 1 }
    luck { 1 }
  end
end

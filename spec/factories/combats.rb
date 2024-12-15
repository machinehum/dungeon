FactoryBot.define do
  factory :combat do
    game { nil }
    player { nil }
    npc { nil }
    turn { "MyString" }
    player_damage { 1 }
    npc_damage { 1 }
  end
end

FactoryBot.define do
  factory :npc_response do
    npc_dialogue { nil }
    next_dialogue { nil }
    effects { "MyText" }
  end
end

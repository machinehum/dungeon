FactoryBot.define do
  factory :npc_dialogue do
    npc { nil }
    dialogue { "MyText" }
    initial { false }
  end
end

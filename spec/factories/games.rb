FactoryBot.define do
  factory :game do
    association :player
    association :node

    trait :with_active_npc do
      after(:build) do |game, evaluator|
        create(:node_encounterable, active: true, node: game.node, encounterable_type: 'GameNpc', encounterable: create(:npc, assertive: false))
      end
    end

    trait :with_inactive_npc do
      after(:build) do |game, evaluator|
        create(:node_encounterable, active: false, node: game.node, encounterable_type: 'GameNpc', encounterable: create(:npc, assertive: false))
      end
    end


    trait :with_active_assertive_npc do
      after(:build) do |game, evaluator|
        create(:node_encounterable, active: true, node: game.node, encounterable_type: 'GameNpc', encounterable: create(:npc, assertive: true))
      end
    end

    trait :with_inactive_assertive_npc do
      after(:build) do |game, evaluator|
        create(:node_encounterable, active: false, node: game.node, encounterable_type: 'GameNpc', encounterable: create(:npc, assertive: true))
      end
    end
  end
end

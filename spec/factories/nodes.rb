FactoryBot.define do
  factory :node do
    label { Faker::Fantasy::Tolkien.location }
    description  { Faker::Lorem.paragraph }
    for_room

    trait :for_room do
      association :locatable, factory: :room
    end

    trait :for_terra do
      association :locatable, factory: :terra
    end

    trait :with_neighbors do
      transient do
        neighbor_count { 1 }
      end
      after(:build) do |node, evaluator|
        neighbors = create_list(:node, evaluator.neighbor_count)
        neighbors.each do |n|
          e = create(:edge)
          create(:portal, edge: e, node: n)
          create(:portal, edge: e, node: node)
        end
      end
    end
  end
end

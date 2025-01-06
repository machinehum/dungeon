FactoryBot.define do
  factory :creature_type do
    label { "MyString" }
    description { "MyText" }
    health { 1 }
    strength { 1 }
    agility { 1 }
    intelligence { 1 }
    connectedness { 1 }
    arcadia { 1 }
    luck { 1 }
  end
end

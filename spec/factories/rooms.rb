FactoryBot.define do
  factory :room do
    label { Faker::Fantasy::Tolkien.location }
    description  { Faker::Lorem.paragraph }
  end
end

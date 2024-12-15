FactoryBot.define do
  factory :terra do
    label { Faker::Fantasy::Tolkien.location }
    description  { Faker::Lorem.paragraph }
  end
end

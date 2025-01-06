FactoryBot.define do
  factory :shop_inventory do
    game_shop { nil }
    game_item { nil }
    game_companion { nil }
    price { 1 }
    stock { 1 }
    buy_price { 1 }
  end
end

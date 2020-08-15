FactoryBot.define do
  factory :item do
    name { "Spice & wolf" }
    description { "this is a book" }
    category_id { 2 }
    state_id { 2 }
    pay_state_id { 2 }
    ship_origin_prefecture_id { 1 }
    ship_prepare_id { 2 }
    price { 500 }
    association :user
  end
end

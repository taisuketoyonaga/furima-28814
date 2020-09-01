FactoryBot.define do
  factory :item do
    name                { Faker::Name.name }
    explain             { '説明' }
    category_id         { '2' }
    status_id           { '2' }
    delivery_fee_id     { '2' }
    shopping_origin_id  { '2' }
    delivery_date_id    { '2' }
    price               { '300' }
    association         :user
  end
end

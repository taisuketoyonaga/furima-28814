FactoryBot.define do
  factory :buy_address do
    # token, :postal_code,:prefectures, :city, :address, :phone_number, :buiding

    token { 'aaaaaaaa' }
    postal_code { '000-1111' }
    prefectures { '1' }
    city { '三田' }
    address { 'すずかけ台' }
    phone_number { '09099991111' }
    item_id { '1' }
    user_id { '1' }
  end
end

class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefectures, :city, :address, :building, :phone_number, :token

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true

def save
  Buy.create(item_id: item_id, user_id: user_id)
  Address.create( postal_code: postal_code, prefectures: prefectures, city: city, address: address, building: building, phone_number: phone_number)
end


end

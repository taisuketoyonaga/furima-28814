class BuyAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefectures, :city, :address, :building, :phone_number, :token

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true
  validates :prefectures, presence: true, numericality: { other_than: 0, message: "is not choosen" }
  validates :address, presence: true
  validates :city, presence: true
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid"}
  end
def save
  buy = Buy.create(item_id: item_id, user_id: user_id)
  Address.create( postal_code: postal_code, prefectures: prefectures, city: city, address: address, building: building, phone_number: phone_number,buy_id: buy.id)
 end


end

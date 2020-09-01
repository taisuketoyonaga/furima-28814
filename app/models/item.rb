class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

 #バリデーションの記入
  validates :image, presence: true
  validates :name,  presence: true

  validates :category_id, 
           :status_id,
           :delivery_fee_id,
           :shopping_origin_id,
           :delivery_date_id,  presence: true, numericality: { other_than: 1 } 
                                                               #ここ↓↓は勘
  with_options presence: true, format: { with: /\A[0-9]+\z/, minmum: 300, maximum: 9999999, message: 'Halh-width numbers' } do
  validates :price
  end
end


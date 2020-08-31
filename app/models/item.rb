class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

#バリデーションの記入
 validates :image, presence: true
 validates :name, presence: true

 validates :category_id, 
           :status_id,
           :delivery_fee_id,
           :shopping_origin_id,
           :delivery_date_id,
           presence: true, numericality: { other_than: 1 } 
end

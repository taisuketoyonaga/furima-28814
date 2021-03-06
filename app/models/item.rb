class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

  validates :image, presence: true
  validates :name,  presence: true
  validates :explain, presence: true

  validates :category_id,
            :status_id,
            :delivery_fee_id,
            :shopping_origin_id,
            :delivery_date_id, presence: true, numericality: { other_than: 1 }
  with_options presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
               format: { with: /\A[0-9]+\z/, message: 'Halh-width numbers' } do
    validates :price
  end
end

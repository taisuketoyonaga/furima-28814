class Item < ApplicationRecord
  belongs_to :user
  has_one :buy
  has_one_attached :image

#バリデーションの記入
 validates :image, presence: true

end

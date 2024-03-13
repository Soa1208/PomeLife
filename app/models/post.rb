class Post < ApplicationRecord
  
  belongs_to :customer
  belongs_to :pet
  
  validates :customer_id, presence: true
  
  has_one_attached :image
end

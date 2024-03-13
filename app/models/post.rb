class Post < ApplicationRecord
  
  belongs_to :customer
  belongs_to :pet
  has_many :comments, dependent: :destroy
  
  validates :customer_id, presence: true
  
  has_one_attached :image
end

class Pet < ApplicationRecord
  belongs_to :customer
  has_many :posts
  
  has_one_attached :image
  
  enum breed_type: { purebred: 0, mixed_breed: 1 }
  enum gender: { male: 0, female: 1 }
end

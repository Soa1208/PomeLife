class Pet < ApplicationRecord
    
  has_one_attached :pet_image
  
  enum breed_type: { purebred: 0, mixed_breed: 1 }
  enum gender: { male: 0, female: 1 }
end

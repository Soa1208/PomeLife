class Question < ApplicationRecord
  belongs_to :customer
  has_many :answers, dependent: :destroy
  
  has_one_attached :image
end

class Post < ApplicationRecord
  
  belongs_to :customer
  belongs_to :pet
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :customer_id, presence: true
  
  has_one_attached :image
  
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end

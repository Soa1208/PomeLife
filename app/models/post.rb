class Post < ApplicationRecord
  
  belongs_to :customer
  belongs_to :pet
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :customer_id, presence: true
  validates :pet_id, presence: true
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 140 }
  validates :post_image, presence: true
  
  has_one_attached :post_image
  
  def get_post_image(width, height)
    post_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def favorited_by?(customer)
    customer.present? && favorites.exists?(customer_id: customer.id)
  end
  
  def self.search_for(content)
    content_half_width = content.tr('０-９', '0-9')
    content_full_width = content.tr('0-9', '０-９')
    Post.where('title LIKE ? OR content LIKE ? OR title LIKE ? OR content LIKE ?', "%#{content_half_width}%", "%#{content_half_width}%", "%#{content_full_width}%", "%#{content_full_width}%")
  end
end

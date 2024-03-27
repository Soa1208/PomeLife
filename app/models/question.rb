class Question < ApplicationRecord
  belongs_to :customer
  has_many :answers, dependent: :destroy
  
  has_one_attached :question_image
  
  validates :customer_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true, length: { maximum: 300 }
  validates :category, length: { maximum: 10 }
  
  def get_question_image(width, height)
    question_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def self.search_for(content)
    content_half_width = content.tr('０-９', '0-9')
    content_full_width = content.tr('0-9', '０-９')
    Question.where('title LIKE ? OR content LIKE ? OR title LIKE ? OR content LIKE ?', "%#{content_half_width}%", "%#{content_half_width}%", "%#{content_full_width}%", "%#{content_full_width}%")
  end
  
  def self.tag_search_for(content)
    where('category LIKE ?', "%#{content}%")
  end
  
end

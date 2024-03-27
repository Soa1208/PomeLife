class Pet < ApplicationRecord
  belongs_to :customer
  has_many :posts, dependent: :destroy
  
  has_one_attached :pet_image
  
  validates :name, presence: true, length: { maximum: 8 }
  validates :birthday, presence: true
  validates :gender, presence: true
  validates :pet_image, presence: true
  validates :introduction, length: { maximum: 150 }
  
  def get_pet_image(width, height)
    pet_image.variant(resize_to_limit: [width, height]).processed
  end
  
  enum breed_type: { purebred: 0, mixed_breed: 1 }
  enum gender: { male: 0, female: 1 }
  
  def age
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(year: now.year) > now ? 1 : 0)
  end
  
  def self.search_for(content)
    content_half_width = content.tr('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z')
    content_full_width = content.tr('0-9a-zA-Z', '０-９ａ-ｚＡ-Ｚ')
    Pet.where('name LIKE ? OR name LIKE ?', "%#{content_half_width}%", "%#{content_full_width}%")
  end
end

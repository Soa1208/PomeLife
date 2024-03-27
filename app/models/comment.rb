class Comment < ApplicationRecord
  belongs_to :customer
  belongs_to :post
  
  validates :comment, presence: true, length: { maximum: 300 }
  validate :validate_charset

  private

  def validate_charset
    if comment.present? && comment.match?(/\A[\x20-\x7Eｦ-ﾟ]+\z/)
      errors.add(:comment, '半角のみのコメントはできません。')
    end
  end
end

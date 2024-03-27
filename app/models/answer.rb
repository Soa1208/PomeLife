class Answer < ApplicationRecord
  belongs_to :customer
  belongs_to :question
  
  validates :answer, presence: true, length: { maximum: 300 }
  validate :validate_charset

  private

  def validate_charset
    if answer.present? && answer.match?(/\A[\x20-\x7Eｦ-ﾟ]+\z/)
      errors.add(:answer, '半角のみのコメントはできません。')
    end
  end
end

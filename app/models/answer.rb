class Answer < ApplicationRecord
  belongs_to :customer
  belongs_to :question
  
  validates :answer, presence: true
end

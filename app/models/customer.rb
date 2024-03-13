class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :pets, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :answers, dependent: :destroy
  
  has_one_attached :image
  
  def customer_status
    if is_active == true
      "有効"
    else
      "退会"
    end
  end
  
  def active_for_authentication?
    super && (is_active == true)
  end
  
  def full_name
    last_name + " " + first_name
  end

  def full_name_kana
    last_name_kana + " " + first_name_kana
  end
end

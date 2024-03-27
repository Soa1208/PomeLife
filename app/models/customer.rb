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
  has_many :favorites, dependent: :destroy
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :display_name, presence: true, length: { maximum: 8 }
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :email, uniqueness: true
  validates :introduction, length: { maximum: 150 }
  
  has_one_attached :profile_image
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def customer_status
    if is_active == true
      "有効"
    else
      "ログイン制限中"
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
  
  def self.search_for(content)
    Customer.where('display_name LIKE :content OR last_name LIKE :content OR first_name LIKE :content OR last_name_kana LIKE :content OR first_name_kana LIKE :content', content: "%#{content}%")
  end
  
  GUEST_CUSTOMER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_CUSTOMER_EMAIL) do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.display_name = "ゲスト"
      customer.first_name = "ゲスト"
      customer.last_name = ""
      customer.first_name_kana = ""
      customer.last_name_kana = ""
      customer.postal_code = ""
      customer.address = ""
      customer.telephone_number = ""
    end
  end
  
  def guest_customer?
    email == GUEST_CUSTOMER_EMAIL
  end
end

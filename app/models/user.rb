class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
                    before_validation { email.downcase! }
  # has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :pictures
  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
end

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image

  has_secure_password
  validates :fname, :lname, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 5 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :image, presence: false, blob: { content_type: ['image/png','image/jpg']}
end

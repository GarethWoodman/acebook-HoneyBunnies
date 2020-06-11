class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many_attached :images, dependent: :destroy

  validates :message, presence: true
end

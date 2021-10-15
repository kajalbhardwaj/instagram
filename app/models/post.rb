class Post < ApplicationRecord
  validates :title, presence: true 
  validates :conetent, length: { minimum: 100 }
  has_one_attached :avatar
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end

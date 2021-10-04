class Post < ApplicationRecord
  
  has_one_attached :avatar
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :comments
  has_many :likes
end

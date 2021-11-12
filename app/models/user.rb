class User < ApplicationRecord
  has_many :following, foreign_key: "follower_id", class_name: "Relationship"
  has_many :followers, foreign_key: "followed_id", class_name: "Relationship"
  rolify 
  has_one_attached :photo
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
end

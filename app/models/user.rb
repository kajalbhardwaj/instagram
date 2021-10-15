class User < ApplicationRecord
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

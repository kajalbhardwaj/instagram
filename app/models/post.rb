class Post < ApplicationRecord
  validates :title, presence: true 
  validates :conetent, length: { minimum: 100 }
  has_one_attached :avatar
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
 

 def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << %w{post_id title content user_email}
        all.each do |post|
          
          u_email = User.find(post.user_id).email
      
          csv << [
            post.id,
            post.title,
            post.conetent,
            u_email
          ]
      end
   end
 end


end

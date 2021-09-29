class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validate :user_id, uniqueness: {scope: :post_id}
end

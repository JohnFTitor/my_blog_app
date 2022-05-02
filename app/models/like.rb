class Like < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :post

  def self.update_count(post)
    count = post.likes.count
    post.update(likes_counter: count)
  end
end

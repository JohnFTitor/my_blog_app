class Comment < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :post 

  def self.update_count(post)
    count = post.comments.count
    post.update(comments_counter: count)
  end
end

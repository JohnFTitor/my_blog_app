class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_count
    post.increment!(:comments_counter)
  end
end

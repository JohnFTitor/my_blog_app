class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def self.update_count(user)
    count = user.posts.count
    user.update(posts_counter: count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end

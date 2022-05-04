class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_create :initialize_values

  after_destroy do
    author.decrement!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private 

  def initialize_values 
    author.increment!(:posts_counter)
    update(comments_counter: 0)
    update(likes_counter: 0)
  end
end

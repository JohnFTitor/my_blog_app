class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :initialize_values

  after_destroy do
    author.decrement!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5).includes(:author)
  end

  def liked?(user)
    likes.find { |like| like.author_id == user.id }
  end

  private

  def initialize_values
    author.increment!(:posts_counter)
    update(comments_counter: 0)
    update(likes_counter: 0)
  end
end

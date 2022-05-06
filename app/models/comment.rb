class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  validates :text, presence: true

  after_create do
    post.increment!(:comments_counter)
  end

  after_destroy do
    post.decrement!(:comments_counter)
  end
end

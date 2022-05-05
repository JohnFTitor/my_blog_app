class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  validates :author_id, uniqueness: {scope: :post_id}

  after_create do
    post.increment!(:likes_counter)
  end

  after_destroy do
    post.decrement!(:likes_counter)
  end
end

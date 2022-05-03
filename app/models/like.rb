class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_create do 
    post.increment!(:likes_counter)
  end

  after_destroy do
    post.decrement!(:likes_counter)
  end
end

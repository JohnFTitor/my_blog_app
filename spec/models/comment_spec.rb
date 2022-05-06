require 'rails_helper'

RSpec.describe 'Comment', type: :model do 
  
  before :all do 
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
    @user = User.create(name: 'name', photo: 'link', bio: 'some')
    @post = Post.create(title: 'title', text: 'text', author: @user, likes_counter: 0, comments_counter: 0)
  end

  subject { Comment.create(author: @user, post: @post, text: 'text') }

  it 'should update post likes_counter' do 
    expect(subject.post.comments_counter).to eq(1)
  end
end

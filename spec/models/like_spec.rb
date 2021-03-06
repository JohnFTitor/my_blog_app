require 'rails_helper'

RSpec.describe 'Like', type: :model do
  before :all do
    User.destroy_all
    @user = User.create(name: 'name', photo: 'link', bio: 'some', email: 'fakeemail2@gmail.com',
                        password: '123456', confirmed_at: DateTime.now, posts_counter: 0)
    @post = Post.create(title: 'title', text: 'text', author: @user, likes_counter: 0, comments_counter: 0)
  end

  subject { Like.create(author: @user, post: @post) }

  it 'should update post likes_counter' do
    expect(subject.post.likes_counter).to eq(1)
  end
end

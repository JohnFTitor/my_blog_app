require 'rails_helper'

RSpec.describe 'Comment', type: :model do
  before :all do
    User.destroy_all
    @user = User.create(name: 'name', photo: 'link', bio: 'some', email: 'fakeemail2@gmail.com',
                        password: '123456', confirmed_at: DateTime.now, posts_counter: 0)
    @post = Post.create(title: 'title', text: 'text', author: @user, likes_counter: 0, comments_counter: 0)
  end

  subject { Comment.new(author: @user, post: @post, text: 'text') }

  it 'should update post likes_counter' do
    @post.comments_counter = 0
    subject.save
    expect(subject.post.comments_counter).to eq(1)
  end

  it 'should have text' do
    subject.text = ''
    expect(subject).to_not be_valid
  end
end

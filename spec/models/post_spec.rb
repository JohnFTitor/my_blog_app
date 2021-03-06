require 'rails_helper'

RSpec.describe 'Post', type: :model do
  before :all do
    User.destroy_all
    @user = User.create(name: 'name', photo: 'link', bio: 'some', email: 'fakeemail2@gmail.com',
                        password: '123456', confirmed_at: DateTime.now, posts_counter: 0)
  end

  subject { Post.new(title: 'title', text: 'text', comments_counter: 0, likes_counter: 0, author: @user) }

  describe 'should implement methods' do
    it 'should return 5 most recent comments' do
      last_five_comments = []
      (1..10).each do |i|
        comment = Comment.new(text: "Some comment #{i}", author: @user)
        comment.post = subject
        comment.save

        last_five_comments << comment if i > 5
      end

      recent_comments = subject.recent_comments

      expect(recent_comments.length).to eq(5)
      expect(recent_comments).to eq(last_five_comments.reverse)
    end

    it 'should increase post_counter method of author' do
      @user.posts_counter = 0
      subject.save
      expect(subject.author.posts_counter).to eq(1)
    end
  end

  describe 'should implement validations' do
    it 'should not have a blank title' do
      subject.title = ''
      expect(subject).to_not be_valid
    end

    it 'should not be greater than 250 char' do
      subject.title = 'z' * 300
      expect(subject).to_not be_valid
    end

    it 'should have comments_counter' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'should have likes_counter' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'where comments are greater than or equal to zero' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'where likes are greater than or equal to zero' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end
end

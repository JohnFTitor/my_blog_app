require 'rails_helper'

RSpec.describe 'User', type: :model do
  before :all do 
    Comment.destroy_all
    Post.destroy_all
    User.destroy_all
  end
  
  subject { User.new( name: 'test', photo: 'link', bio: 'bio') }

  it 'should return three most recent posts' do 
    (1..10).each do |i|
      post = Post.new( title: "title-#{i}", text: 'text' )
      post.author = subject
      post.save
    end
    recent_posts = subject.recent_posts
    expect(recent_posts.length).to eq(3)
  end

  it 'should not have blank name' do 
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'should have a value in posts_counter' do 
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  describe 'should have an integer value in posts_counter' do
    it 'should not accept string' do 
      subject.posts_counter = 'some invalid string'
      expect(subject).to_not be_valid
    end

    it 'should not accept boolean' do 
      subject.posts_counter = true
      expect(subject).to_not be_valid
    end

    it 'should not accept array' do 
      subject.posts_counter = []
      expect(subject).to_not be_valid
    end
  end
end

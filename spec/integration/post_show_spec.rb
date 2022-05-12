require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  describe 'User Info' do
    before :all do
      User.destroy_all
      user1 = User.create(id: 1, name: 'User-1', photo: 'user_image-1', bio: 'some1', email: "user1@example.com", password: "123456", confirmed_at: DateTime.now, posts_counter: 0)      
      user2 = User.create(id: 2, name: 'User-2', photo: 'user_image-1', bio: 'some1', email: "user2@example.com", password: "123456", confirmed_at: DateTime.now, posts_counter: 0)      
      @post = Post.create(id: 1, title: "Sample Title", text: 'a'*300, comments_counter: 0, likes_counter: 0, author: user1)
      (1..5).each do |j|
        comment = Comment.new(text: "Some comment #{j}", author: user1)
        comment.post = @post
        comment.save        
      end
      (6..10).each do |i|
        comment = Comment.new(text: "Some comment #{i}", author: user2)
        comment.post = @post
        comment.save        
      end
    end

    before :each do
      visit user_post_path(user_id: 1, id: 1)
    end

    it "should show the post's title" do
      expect(page).to have_content('Sample Title')
    end

    it "should have the author's name" do
      expect(page).to have_content('by User-1')
    end

    it 'should have how many comments a post has' do      
      expect(page).to have_content('Comments: 10')
    end

    it 'should have how many likes a post has' do
      expect(page).to have_content('Likes: 0')
    end

    it "should have the post's body" do
      expect(page).to have_content('a'*300)
    end

    it "should have the username of each commentor" do
      expect(page).to have_content('User-1:')
      expect(page).to have_content('User-2:')
    end

    it "should have the comment of each commentor" do
      expect(page).to have_content('User-1: Some comment 1')
      expect(page).to have_content('User-2: Some comment 7')
    end
  end    
end

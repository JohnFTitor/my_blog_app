require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  describe 'User Info' do
    before :all do
      Post.destroy_all
      User.destroy_all
      @user= User.create(id: 1, name: 'User-1', photo: 'user_image-1', bio: 'some1', email: "user1@example.com", password: "123456", confirmed_at: DateTime.now, posts_counter: 0)      
      (1..10).each do |i|
        post = Post.new(id: i, title: "title-#{i}", text: 'a'*300, comments_counter: 0, likes_counter: 0)
        post.author = @user
        post.save
        (1..10).each do |j|
          comment = Comment.new(text: "Some comment #{j}", author: @user)
          comment.post = post
          comment.save        
        end
      end
    end

    before :each do
      visit user_posts_path(user_id: 1)
    end

    it "should have the user's profile picture" do 
      images = page.find_all('img')
      expect(images.length).to eq(1)
      expect(page).to have_xpath("//img[contains(@src,'user_image-1')]")       
    end

    it "should have the user's name" do
      expect(page).to have_content('User-1')
    end

    it 'Should show the number of posts the user has written.' do
      visit user_path(id: 1)
      user1 = page.find('div', id: '1 User-card')
      expect(user1).to have_content("Number of Posts: 10")      
    end

    it "should shows the post's title" do
      expect(page).to have_content('title-5')
    end

    it "should have the post's body" do
      post = page.find('a', id: 'Post: 5')      
      expect(post).to have_content('a'*147)
    end

    it "should have the first comments on a post" do
      expect(page).to have_content('Some comment 10')
      expect(page).to have_content('Some comment 9')
      expect(page).to have_content('Some comment 8')      
      expect(page).to_not have_content('Some comment 5')
    end

    it 'should have how many comments a post has' do
      post = page.find('a', id: 'Post: 5')      
      expect(post).to have_content('Comments: 10')
    end

    it 'should have how many comments a post has' do
      post = page.find('a', id: 'Post: 5')      
      expect(post).to have_content('Likes: 0')
    end

    it "should redirect me to that post's show page" do
      post = page.find('a', id: 'Post: 3')

      post.click

      expect(page).to have_current_path(user_post_path(id: 3, user_id: 1))
    end
  end    
end

require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  describe 'User Info' do
    before :all do
      User.destroy_all
      @user = User.create(id: 1, name: 'User-1', photo: 'user_image-1', bio: 'some1', email: 'user1@example.com',
                          password: '123456', confirmed_at: DateTime.now, posts_counter: 0)
      (1..10).each do |i|
        post = Post.new(id: i, title: "title-#{i}", text: 'text', comments_counter: 0, likes_counter: 0)
        post.author = @user
        post.save
      end
    end

    before :each do
      visit user_path(id: 1)
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
      expect(user1).to have_content('Number of Posts: 10')
    end

    it "should have the user's bio" do
      expect(page).to have_content('some1')
    end

    it 'should return three most recent posts' do
      posts = page.find_all('.post')

      expect(page).to have_content('title-10')
      expect(page).to have_content('title-9')
      expect(page).to have_content('title-8')
      expect(posts.length).to eq(3)
      expect(page).to_not have_content('title-7')
    end

    it 'should have a button to see all posts' do
      see_all_posts = page.find_link('See more Posts')
      expect(see_all_posts).to have_content('See more Posts')
    end

    it "should redirect me to that post's show page" do
      post = page.find('a', id: 'Post: 10')

      post.click

      expect(page).to have_current_path(user_post_path(id: 10, user_id: 1))
    end

    it 'should have a button to see all posts' do
      see_all_posts = page.find_link('See more Posts')

      see_all_posts.click

      expect(page).to have_current_path(user_posts_path(user_id: 1))
    end
  end
end

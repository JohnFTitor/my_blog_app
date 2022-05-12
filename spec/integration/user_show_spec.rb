require 'rails_helper'

RSpec.describe 'User Show Page', type: :feature do
  describe 'User Info' do
    before :all do
      User.destroy_all
      @user= User.create(id: 1, name: 'User-1', photo: 'user_image-1', bio: 'some1', email: "user1@example.com", password: "123456", confirmed_at: DateTime.now, posts_counter: 12)      
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
      user1 = page.find('div', id: '1 User-card')
      expect(user1).to have_content("Number of Posts: #{@user.posts_counter}")      
    end

    it "should have the user's bio" do
      expect(page).to have_content('some1')
    end
  end

    
end

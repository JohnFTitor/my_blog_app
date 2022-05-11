require 'rails_helper'

RSpec.describe 'Login', type: :system do
  describe 'New session page' do
    before :all do
      User.destroy_all
      User.create(name: 'name', photo: 'link', bio: 'some', email: "user@example.com",
        password: "123456", confirmed_at: DateTime.now, posts_counter: 0)
    end

    it 'See the username and password inputs and the "Submit" button.' do
      visit new_user_session_path      
      email = find_field('Email')
      password = find_field('Password')
      login = find_button('Log in')
      expect(email).to_not be_nil
      expect(password).to_not be_nil
      expect(login).to_not be_nil
      expect(page).to have_content('Log in')
    end

    it 'When click the submit button without filling in the email and the password, should get a detailed error.' do
      visit new_user_session_path
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'When click the submit button after filling in the email and the password with incorrect data, should get a detailed error.' do
      visit new_user_session_path      
      fill_in('Email', with: 'user@example.com')
      fill_in('Password', with: '123')
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'When click the submit button after filling in the email and the password with correct data, I am redirected to the root page.' do
      visit new_user_session_path      
      fill_in('Email', with: 'user@example.com')
      fill_in('Password', with: '123456')
      click_button 'Log in'     
      expect(page.current_path).to have_content('/')
    end
  end
end

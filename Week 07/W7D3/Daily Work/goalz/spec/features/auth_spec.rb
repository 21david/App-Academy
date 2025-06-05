require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New user'
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'email', with: 'john@gmail.com'
      fill_in 'password', with: 'password123'
      click_on 'Create User'
    end

    scenario 'shows email on the homepage after signup' do
      expect(page).to have_content 'Homepage'
    end
  end
end

feature 'logging in' do
    # before(:each) do
    #     visit new_session_url
    #     fill_in 'user[email]', with: 'john@gmail.com'
    #     fill_in 'user[password]', with: 'password123'
    #     click_on 'Log In'
    # end
    
    scenario 'shows username on the homepage after login' do
        User.create(email:'john@gmail.com', password: 'password123')
        visit user_url(User.last)
        expect(page).to have_content 'john@gmail.com'
    end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    User.create(email:'john@gmail.com', password: 'password123')
    log_in_user(User.last)
    logout
    # ApplicationController.login(User.last)
    # ApplicationController.logout!
    expect(page).to have_content('New user')
  end

  scenario 'doesn\'t show username on the homepage after logout'

end
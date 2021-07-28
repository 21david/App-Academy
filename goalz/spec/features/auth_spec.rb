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
  scenario 'shows username on the homepage after login' do
    visit new_session_url
    expect(page).to have_content 'john@gmail.com'
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
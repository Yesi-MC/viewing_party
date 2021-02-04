require 'rails_helper'

describe 'User login' do
  describe 'happy path' do
    it 'allows users to login' do
      user = User.create(email: 'user@example.com', password: 'password')

      visit root_path

      fill_in :email, with: user.email
      fill_in :password, with: user.password

      click_button 'Log In'

      expect(page).to have_content("Welcome, #{user.email}")
    end
  end
end

require 'rails_helper'

describe 'User login' do
  describe 'happy path' do
    it 'allows users to login' do
      user = User.create(email: 'user@example.com', password: 'password')

      visit root_path

      click_link 'I have an account'

      expect(current_path).to eq('/login')

      fill_in :email, with: user.email.upcase
      fill_in :password, with: user.password

      click_button 'Log In'

      expect(current_path).to eq("/users/#{user.id}/dashboard")
      expect(page).to have_content("Welcome, #{user.email}")
      expect(page).to have_content("Log Out")
      expect(page).to_not have_content("Sign Up")
      expect(page).to_not have_content("Log In")
    end
  end
  describe 'sad path' do
    it 'blocks login if credentials are bad' do
      user = User.create(email: 'user@example.com', password: 'password')

      visit root_path

      click_link 'I have an account'

      expect(current_path).to eq('/login')

      fill_in :email, with: user.email.upcase
      fill_in :password, with: 'wrongpassword'

      click_button 'Log In'

      expect(page).to have_content("Invalid credentials, please try again")
      expect(current_path).to eq("/login")
    end
  end
end

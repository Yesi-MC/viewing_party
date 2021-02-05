require 'rails_helper'

describe 'User registration' do
  describe 'happy path' do
    it 'Allows user to register' do
      visit root_path

      click_link 'Sign Up'

      expect(current_path).to eq(new_user_path)

      email = 'partyinthekitchen@exemple.com'
      password = 'hellyeah'
      password_confirmation = 'hellyeah'

      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: password

      click_button 'Create User'

      user = User.first

      expect(current_path).to eq("/users/#{user.id}/dashboard")
      expect(page).to have_content("Welcome, #{email}")
    end
    it 'It redirect users that are logged in to the dashboard' do
      user = User.create(email: 'user@example.com', password: 'password')

      visit root_path

      click_on 'I have an account'

      fill_in :email, with: user.email.upcase
      fill_in :password, with: user.password

      click_on 'Log In'

      visit root_path

      expect(current_path).to eq("/users/#{user.id}/dashboard")
    end
  end
  describe 'sad path' do
    it 'Blocks users from registering if email is invalid' do
      visit root_path

      click_link 'Sign Up'

      expect(current_path).to eq(new_user_path)

      email = 123
      password = 'hellyeah'
      password_confirmation = 'hellyeah'

      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: password

      click_button 'Create User'

      expect(page).to have_content("Invalid credentials, please try again")
      expect(current_path).to eq(new_user_path)
    end
  end
end

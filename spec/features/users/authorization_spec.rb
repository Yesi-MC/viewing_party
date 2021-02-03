require 'rails_helper'

describe 'User registration' do
  describe 'happy path' do
    it 'Allows user to register' do
      visit root_path

      click_link 'Sign Up'

      expect(current_path).to eq(new_user_path)

      email = 'partyinthekitchen@exemple.com'
      password = 'hellyeah'

      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password

      click_button 'Create User'

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome, #{email}")
    end
  end
end

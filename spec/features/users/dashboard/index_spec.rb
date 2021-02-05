require 'rails_helper'

RSpec.describe 'Dashboard Index' do
  describe 'Dashboard shows all links and buttons' do
    describe 'Happy Path' do
      it 'can click on a Discover Movies button' do
        visit login_path
        email = "email@gmail.com"
        password = "test"
        user = User.create(email: email, password: password)
        fill_in :email, with: email
        fill_in :password, with: password
        click_on "Log In"
        expect(page).to have_content("Welcome, #{user.email}")
        
        within('section#friends') do
          # User currently has no friends
          expect(page).to have_content("You currently have no friends")
        end
        within('section#viewing-parties') do
          expect(page).to have_content("Feeling like partying?")
          expect(page).to have_link("Click here to start a party!")
        end
        expect(page).to have_button("Discover Movies")
        click_on "Discover Movies"
        
        expect(current_path).to eq(discover_index_path)
      end
    end
  end
end
require 'rails_helper'

RSpec.describe 'Dashboard Index' do
  describe 'Dashboard shows all links and buttons' do
      it 'can click on a Discover Movies button' do
        visit login_path
        email = "email@gmail.com"
        password = "test"
        user = User.create(email: email, password: password)
        fill_in :email, with: email
        fill_in :password, with: password
        click_on "Log In"

        click_on "Discover Movies"

        expect(page).to have_content("Welcome, #{user.email}")
        expect(page).to have_button("Discover Movies")
        within('section#friends') do
          # User currently has no friends
          expect(page).to have_content("You currently have no friends")
        end
        within('section#viewing-parties') do
          expect(page).to have_content("Feeling like partying?")
          expect(page).to have_link("Click here to start a party!")
        end
      end
  end
end
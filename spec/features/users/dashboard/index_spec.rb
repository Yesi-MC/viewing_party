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
          expect(page).to have_button("Add Friend")
          expect(page).to have_field(:email)
        end
        within('section#viewing-parties') do
          expect(page).to have_content("Feeling like partying?")
          expect(page).to have_link("Click here to start a party!")
        end
        expect(page).to have_button("Discover Movies")
        click_on "Discover Movies"
        
        expect(current_path).to eq(discover_index_path)
      end
      it 'can find friends and add them as friends' do
        visit login_path
        email = "email@gmail.com"
        password = "test"
        user = User.create(email: email, password: password)
        fill_in :email, with: email
        fill_in :password, with: password
        click_on "Log In"
        friend_email = "friend@gmail.com"
        friend_password = "test1"
        friend = User.create(email: friend_email, password: friend_password)
        
        fill_in :email, with: friend_email
        click_on "Add Friend"

        expect(user.friends).to eq([friend])
        expect(current_path).to eq("/users/#{user.id}/dashboard")
        
        within('section#friends') do
          # User currently has no friends
          expect(page).to_not have_content("You currently have no friends")
          expect(page).to have_content(friend.email)
          expect(page).to have_button("Add Friend")
          expect(page).to have_field(:email)
        end
      end
    end
    describe 'Sad Paths' do
      it 'cannot add friends who are not in the database' do
        visit login_path
        email = "email@gmail.com"
        password = "test"
        user = User.create(email: email, password: password)
        fill_in :email, with: email
        fill_in :password, with: password
        click_on "Log In"
        friend_email = "friend@gmail.com"
        
        
        fill_in :email, with: friend_email
        click_on "Add Friend"

        expect(page).to have_content("Person does not exist!")
      end
    end
  end
end
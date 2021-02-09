require 'rails_helper'

RSpec.describe 'New Party Page' do
  describe 'Happy Path' do
    describe 'Create New Party' do
      it 'can create a party based on clicking on specific movie from search' do
        VCR.use_cassette("search_movies") do
          VCR.use_cassette("spy_kids_details") do
            user = User.create(email: 'user@example.com', password: '1234')
            friend = User.create(email: 'friend@friend.com', password: '1234')
            Friendship.create(user_id: user.id, friend_id: friend.id)

            visit discover_index_path
            fill_in "movie", with: "Untitled Spy Kids Reboot"
            click_on "Search"
          
            click_on "Untitled Spy Kids Reboot"
            
            click_on "Create a Viewing Party for Movie"

            expect(current_path).to eq(new_watch_party_path)
            expect(page).to have_content("Untitled Spy Kids Reboot")
            within('input#runtime') do
              expect(page).to have_content("0")
            end
            within('section#date') do
              expect(page).to have_content("Date")
            end
            within('section#start-time') do
              expect(page).to have_content("Start Time: ")
            end
            within('section#friends-invitable') do
              expect(page).to have_content("friend@friend.com")
            end
            
            click_on "Create A Party!"

            expect(current_path).to eq(dashboard_index_path)
          end
        end
      end
    end
  end
  describe 'Sad Path' do

  end
end
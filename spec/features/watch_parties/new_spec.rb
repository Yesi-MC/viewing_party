require 'rails_helper'

RSpec.describe 'New Party Page' do
  describe 'Happy Path' do
    describe 'Create New Party' do
      it 'can create a party based on clicking on specific movie from search' do
        VCR.use_cassette("search_movies") do
          VCR.use_cassette("spy_kids_details") do
            user = User.create(email: 'user@example.com', password: '1234')
            friend = User.create(email: 'friend@friend.com', password: '1234')
            other_friend = User.create(email: 'other_friend@friend.com', password: '1234')
            Friendship.create(user_id: user.id, friend_id: friend.id)
            Friendship.create(user_id: user.id, friend_id: other_friend.id)

            visit login_path

            fill_in "email", with: user.email
            fill_in "password", with: user.password
            click_on "Log In"

            click_on "Discover Movies"
            
            fill_in "movie", with: "Untitled Spy Kids Reboot"
            click_on "Search"
         
            click_on "Untitled Spy Kids Reboot"

            click_on "Create a Viewing Party for Movie"

            fill_in "watch_party[date]", with: "03-03-2021"
            fill_in "watch_party[duration]", with: "120"

            expect(current_path).to eq(new_watch_party_path(user))
            expect(page).to have_content("Movie: Untitled Spy Kids Reboot")

            expect(page).to have_content(friend.email)
            
            within("section#friend-#{friend.id}") do
              check "User_#{friend.id}"
            end

            within("section#friend-#{other_friend.id}") do
              check "User_#{other_friend.id}"
            end

            click_button "Create Party"

            expect(current_path).to eq(dashboard_path(user.id))
          end
        end
      end
      it 'can add friends to the watch party upon creation and host can see hosting parties' do
        VCR.use_cassette("search_movies") do
          VCR.use_cassette("spy_kids_details") do
            user = User.create(email: 'user@example.com', password: '1234')
            friend = User.create(email: 'friend@friend.com', password: '1234')
            other_friend = User.create(email: 'other_friend@friend.com', password: '1234')
            Friendship.create(user_id: user.id, friend_id: friend.id)
            Friendship.create(user_id: user.id, friend_id: other_friend.id)

            visit login_path

            fill_in "email", with: user.email
            fill_in "password", with: user.password
            click_on "Log In"

            click_on "Discover Movies"
            
            fill_in "movie", with: "Untitled Spy Kids Reboot"
            click_on "Search"
            
            movie_title = "Untitled Spy Kids Reboot"
            party_date = "03-03-2021"
            party_time = "15:20"
            party_runtime = "120"
         
            click_on movie_title

            click_on "Create a Viewing Party for Movie"


            fill_in "watch_party[date]", with: party_date
            fill_in "watch_party[time]", with: party_time
            fill_in "watch_party[duration]", with: party_runtime
            page.check "User_#{friend.id}"
            
            click_on "Create Party"
            
            within("section#hosting-parties") do
              expect(page).to have_content("Hosted Parties")
              expect(page).to have_content(movie_title)
              expect(page).to have_content("Date: #{party_date}")
              expect(page).to have_content("Time: #{party_time}")
              expect(page).to have_content("Duration: #{party_runtime}")
            end
          end
        end
      end
      it 'can see parties invited to as a guest' do
        user = User.create(email: 'user@example.com', password: '1234')
        friend = User.create(email: 'friend@friend.com', password: '1234')
        other_friend = User.create(email: 'other_friend@friend.com', password: '1234')
        Friendship.create(user_id: user.id, friend_id: friend.id)
        Friendship.create(user_id: user.id, friend_id: other_friend.id)
        watch_party_1 = user.watch_parties.create(movie_title: "Movie", date: "12-20-2021", time: "15:00", duration: 130)
        watch_party_2 = user.watch_parties.create(user_id: user, movie_title: "Movie2", date: "12-20-2022", time: "15:00", duration: 130)
        Guest.create(invitee_id: friend.id, watch_party_id: watch_party_1.id)
        Guest.create(invitee_id: other_friend.id, watch_party_id: watch_party_2.id)
        
        visit login_path

        fill_in "email", with: friend.email
        fill_in "password", with: friend.password
        click_on "Log In"

        within("section#guesting-parties") do
          expect(page).to have_content("Parties Invited To")
          expect(page).to have_content(watch_party_1.movie_title)
          expect(page).not_to have_content(watch_party_2.movie_title)
          expect(page).to have_content(watch_party_1.date)
          expect(page).to have_content(watch_party_1.time)
          expect(page).to have_content(watch_party_1.duration)
        end
      end
    end
  end
  describe 'Sad Path' do
    it 'cannot create a party with a date that the user is hosting another party on' do
      VCR.use_cassette("search_movies") do
        VCR.use_cassette("spy_kids_details") do
          user = User.create(email: 'user@example.com', password: '1234')
          party = user.watch_parties.create(movie_title: "Test", date: "03-03-2021", duration: 150, time: "15:00")

          visit login_path

          fill_in "email", with: user.email
          fill_in "password", with: user.password
          click_on "Log In"

          click_on "Discover Movies"
          
          fill_in "movie", with: "Untitled Spy Kids Reboot"
          click_on "Search"
       
          click_on "Untitled Spy Kids Reboot"

          click_on "Create a Viewing Party for Movie"

          fill_in "watch_party[date]", with: party.date
          fill_in "watch_party[time]", with: party.time
          fill_in "watch_party[duration]", with: "120"

          click_button "Create Party"

          expect(current_path).to eq(new_watch_party_path(user))
          expect(page).to have_content("You have scheduled another party at this time and date. Please try again.")
        end
      end
    end
  end
end

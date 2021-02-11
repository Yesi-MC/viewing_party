require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  describe 'Happy Paths' do
    describe 'Movie Attributes are shown' do
      it 'can visit a show page and see the movie attributes' do
        VCR.use_cassette("movie_details") do
          movie_id = "100"

          user = User.create(email: 'user@gmail.com', password: 'password')
          user2 = User.create(email: 'user2@gmail.com', password: 'password2')
          user3 = User.create(email: 'user3@gmail.com', password: 'password3')

          friendship = user.friendships.create(friend_id: user2.id )
          friendship = user.friendships.create(friend_id: user3.id )

          visit login_path

          fill_in :email, with: "user@gmail.com"
          fill_in :password, with: "password"

          click_button 'Log In'

          visit movie_details_path(movie_id)

          expect(page).to have_content("Movie Title: Lock, Stock and Two Smoking Barrels")
          expect(page).to have_content("Movie Vote Average: 8.2")
          expect(page).to have_content("Movie run time: 105")
          expect(page).to have_content("Genres: Comedy, Crime")
          expect(page).to have_content("Movie Summary: A card shark and his unwillingly-enlisted friends need to make a lot of cash quick after losing a sketchy poker match. To do this they decide to pull a heist on a small-time gang who happen to be operating out of the flat next door.")
          expect(page).to have_content("Jason Flemyng as Tom")
          expect(page).to have_content("Dexter Fletcher as Soap")
          expect(page).to have_content("P.H. Moriarty as 'Hatchet' Harry Lonsdale")
          expect(page).to have_content("3 Review(s)")
          expect(page).to have_content("Author: BradFlix")
          expect(page).to have_content("I just plain love this movie!")
          expect(page).to have_content("Author: David Perkins")
          expect(page).to have_content("Genuinely one of my favorite movies of all time.")
        end
      end
    end
  end
  describe 'button' do 
    it 'can see a button to create a viewing party' do 
      VCR.use_cassette("movie_details") do
      movie_id = "100"

      user = User.create(email: 'user@gmail.com', password: 'password')
      user2 = User.create(email: 'user2@gmail.com', password: 'password2')
      user3 = User.create(email: 'user3@gmail.com', password: 'password3')

      friendship = user.friendships.create(friend_id: user2.id )
      friendship = user.friendships.create(friend_id: user3.id )

      visit login_path

      fill_in :email, with: "user@gmail.com"
      fill_in :password, with: "password"

      click_button 'Log In'

      visit movie_details_path(movie_id)
      
      expect(page).to have_button("Create a Viewing Party for Movie")

      click_button "Create a Viewing Party for Movie"

      expect(current_path).to eq(new_watch_party_path(user.id))
      end 
    end
  end
end
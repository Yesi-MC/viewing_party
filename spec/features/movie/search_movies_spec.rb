require 'rails_helper'

RSpec.describe 'API Connection' do
  describe 'happy path' do
    it "can search for a movie and see voter average" do
      VCR.use_cassette("search_movies") do
      
        user = User.create(email: 'user@example.com', password: 'password')

        visit discover_index_path
        fill_in "movie", with: "Untitled Spy Kids Reboot"

        click_button "Search"
    
        expect(current_path).to eq(movies_search_path)
        expect(page).to have_content("Untitled Spy Kids Reboot")
        expect(page).to have_content("Voter Average: 0")
      end
    end
    it 'can search for a nonexistent movie and show 0 results' do
      VCR.use_cassette("non_existent_movies") do
    
        user = User.create(email: 'user@example.com', password: 'password')

        visit discover_index_path
        not_a_movie = "asdfasdf"
        fill_in "movie", with: not_a_movie

        click_button "Search"
      
        expect(current_path).to eq(movies_search_path)
        expect(page).to have_content("0 Search Results")
        expect(page).not_to have_content(not_a_movie)
      end
    end
    describe 'sad path' do 
      it "can display error message when no movie is searched" do 
      # user = User.create(email: 'user@example.com', password: 'password')
      json_response = File.read('spec/fixtures/movie_search_data.json')
        stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_api_key']}&query= ").
        to_return(status: 422, body: json_response)
        
        visit discover_index_path

        fill_in "movie", with: ""
        click_button "Search"

        # expect(current_path).to eq(movies_search_path)
        expect(page).to have_content("Please enter a Movie Title")
        expect(current_path).to eq(movies_search_path)
      end 
    end
  end
  # describe 'sad path' do 
      # it 'can search for a nonexistent movie and show 0 results' do
      # VCR.use_cassette("400 status") do
    
      #   user = User.create(email: 'user@example.com', password: 'password')

      #   visit discover_index_path

      #   # not_a_movie = 
      #   fill_in "movie", with: ""

        
      #   click_button "Search"
      #   expect(current_path).to eq(movies_search_path)
      #   expect(page).to have_content("Please enter a Movie Title")
      #   expect(current_path).to eq(movies_search_path)
      # end 
    # end
  # end
end
require 'rails_helper'
require 'webmock/rspec'
WebMock.enable!

RSpec.describe 'API Connection' do
  describe 'happy path' do
    it "can see the top 20 rated movies", :vcr do
      user = User.create(email: 'user@example.com', password: 'password')

      json_response = File.read('spec/fixtures/top_rated_data.json')
        stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=1.json").
        # # with(
        # #   headers: {
        # #  'Accept'=>'*/*',
        # #  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        # #  'User-Agent'=>'Faraday v0.15.4',
        # #  'X-Api-Key'=>'opyjcKdEUKllG8P5V15kv3yKKbx1KwkGQwXbfCF3'
        # #   }).
        to_return(status: 200, body: json_response)

        visit discover_index_path

        click_link "Find Top Rated Movies"
      
        expect(current_path).to eq(movies_path)
        expect(page).to have_content("Gabriel's Inferno Part III")
        expect(page).to have_content("Your Name.")
        expect(page).to have_content("City of God")
    end 
  end 
end
require 'rails_helper'

RSpec.describe 'API Connection' do
  describe 'happy path' do
    it "can see the top 40 rated movies" do
      user = User.create(email: 'user@example.com', password: 'password')

      # json_response = File.read('spec/fixtures/top_rated_data.json')
        stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=1.json").
        # with(
        #   headers: {
        #  'Accept'=>'*/*',
        #  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        #  'User-Agent'=>'Faraday v0.15.4',
        #  'X-Api-Key'=>'opyjcKdEUKllG8P5V15kv3yKKbx1KwkGQwXbfCF3'
        #   }).
        to_return(status: 200, body: "")

        visit dashboard_path(user.id)

        click_button 'Discover Movies'

    end 

  end 
end
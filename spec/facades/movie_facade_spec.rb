require 'rails_helper'

RSpec.describe MovieFacade do
  context "class methods" do
    it "call_api_for_all_top_rated_movies" do
      VCR.use_cassette("top_movies") do

        data = MovieFacade.call_api_for_all_top_rated_movies

        expect(data).to be_a(Array)
        expect(data.count).to eq(40)
        expect(data.first).to be_a(Movie)
      end
    end
    it 'can search for a specific movie' do
      VCR.use_cassette("search_movies") do
        data = MovieFacade.search_movie("Untitled%20Spy%20Kids%20Reboot")

        expect(data).to be_a(Array)
        expect(data.count).to eq(1)
        expect(data.first).to be_a(Movie)
      end
    end
    it 'can see details of movie based on id' do
      VCR.use_cassette("movie_details") do
        data = MovieFacade.api_movie_details("100")
        expect(data.title).to be_a(String)
        expect(data.vote_average).to be_a(Float)
        expect(data.runtime).to be_a(Integer)
        expect(data.genres).to be_a(Array)
        expect(data.overview).to be_a(String)
        expect(data.actors).to be_a(Array)
        expect(data.actors[0][:name]).to be_a(String)
        expect(data.actors[0][:character]).to be_a(String)
        expect(data.reviews).to be_a(Array)
        expect(data.reviews[0][:author]).to be_a(String)
        expect(data.reviews[0][:content]).to be_a(String)
      end 
    end
  end
end

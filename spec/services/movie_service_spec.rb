require 'rails_helper'

RSpec.describe MovieService do
  context "class methods" do
    it "top_rated_movies" do
      VCR.use_cassette("top_movies") do
        data = MovieService.top_rated_movies

        expect(data).to be_a(Array) #expecting the array class

        movie_data = data.first #to the first hash in our array
        #if its an array of things we only want to test the first one
        #and we only want to test the keys we are using

        expect(movie_data).to have_key(:id)
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key(:title)
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key(:vote_average)
        expect(movie_data[:vote_average]).to be_a(Numeric)
        #both integer and float inherit from numeris
        #allows us to have both floats and integers in expectation
      end
    end
    it 'can return search results' do
      VCR.use_cassette('search_results') do
        search_results = MovieService.search_movie('Harry Potter')

        expect(search_results).to be_a(Array)

        first_result = search_results.first

        expect(first_result).to have_key(:title)
        expect(first_result[:title]).to be_a(String)
        expect(first_result).to have_key(:vote_average)
        expect(first_result[:vote_average]).to be_a(Float)
      end
    end
    it 'can show movie details' do
      VCR.use_cassette('movie_details') do
        movie = MovieService.movie_details(100)

        expect(movie).to be_a(Hash)

        expect(movie).to have_key(:genres)
        expect(movie[:genres]).to be_a(Array)

        expect(movie).to have_key(:original_title)
        expect(movie[:original_title]).to be_a(String)

        expect(movie).to have_key(:release_date)
        expect(movie[:release_date]).to be_a(String)

        expect(movie).to have_key(:vote_average)
        expect(movie[:vote_average]).to be_a(Float)
      end
    end
  end
end

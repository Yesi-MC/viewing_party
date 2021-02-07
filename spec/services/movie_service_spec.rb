require 'rails_helper'

RSpec.describe MovieService do 
  context "class methods" do 
    it "top_rated_movies" do
      VCR.use_cassette("top_movies") do
        data = MovieService.top_rated_movies

        expect(data).to be_a(Array) #expecting the aray class 
        
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
  end 
end 
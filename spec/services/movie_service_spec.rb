require 'rails_helper'

RSpec.describe MovieService do
  context "class methods" do
    it "top_rated_movies" do
      VCR.use_cassette("top_movies") do
        data = MovieService.top_rated_movies

        expect(data).to be_a(Array) 

        movie_data = data.first 

        expect(movie_data).to have_key(:id)
        expect(movie_data[:id]).to be_a(Integer)

        expect(movie_data).to have_key(:title)
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key(:vote_average)
        expect(movie_data[:vote_average]).to be_a(Numeric)
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
    it 'returns movie cast' do
      VCR.use_cassette('movie_cast') do
        cast = MovieService.movie_cast(100)

        expect(cast).to be_a(Array)

        expect(cast.first).to have_key(:gender)
        expect(cast.first[:gender]).to be_a(Integer)

        expect(cast.first).to have_key(:name)
        expect(cast.first[:name]).to be_a(String)

        expect(cast.first).to have_key(:character)
        expect(cast.first[:character]).to be_a(String)
      end
    end
    it 'returns movie review' do
      VCR.use_cassette('movie_reviews') do
        reviews = MovieService.movie_reviews(100)

        expect(reviews).to be_a(Array)

        expect(reviews.first).to have_key(:author)
        expect(reviews.first[:author]).to be_a(String)

        expect(reviews.first).to have_key(:content)
        expect(reviews.first[:content]).to be_a(String)

        expect(reviews.first).to have_key(:author_details)
        expect(reviews.first[:author_details]).to be_a(Hash)
      end
    end
  end
end

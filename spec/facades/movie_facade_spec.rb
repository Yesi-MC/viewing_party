require 'rails_helper'

RSpec.describe MovieFacade do 
  context "class methods" do 
    it "call_api_for_all_top_rated_movies" do
      VCR.use_cassette("top_movies") do #if using webmock just call the read file 

        data = MovieFacade.call_api_for_all_top_rated_movies 

        expect(data).to be_a(Array) #an Array of movieopbjects now!!!! MO LONGER array of hashes here 
        expect(data.count).to eq(40) #expecting this amount of objects within the array
        expect(data.first).to be_a(Movie) #expecting the firs thing in the array to be an object

        #facade we dont test for methods or keys or keys to the big hash because 
        #we already tested that in the service and the poro 
      end 
    end 
  end 
end 
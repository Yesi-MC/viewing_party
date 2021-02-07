require 'rails_helper'
# require 'webmock/rspec'
# WebMock.enable!

RSpec.describe 'API Connection' do
  describe 'happy path' do
    it "can see the top 40 rated movies" do
      VCR.use_cassette("top_movies") do #creates cassette
        #L8 creates the casseette- calls api once and saves response in the top_movies.yml  
        #if we change test then al we need to do is delete the to-movies.yml
        #it does whatever is in the code.. but it saves response from that api into that file. 

        #we dont need a webmock when we use vcr. the only thing we need is the gem-but NO webmock response. 
        
        user = User.create(email: 'user@example.com', password: 'password')

        visit discover_index_path

        click_link "Find Top Rated Movies" #this action calls an api so then it saves the reponse from this action into the to-movies file 
    
        expect(current_path).to eq(movies_path)
        expect(page).to have_content("Gabriel's Inferno Part III")
        expect(page).to have_content("Your Name.")
        expect(page).to have_content("City of God")
      end 
    end 
  end 
end
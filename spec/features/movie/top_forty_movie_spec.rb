require 'rails_helper'

RSpec.describe 'API Connection' do
  describe 'happy path' do
    it "can see the top 40 rated movies" do
      VCR.use_cassette("top_movies") do
        user = User.create(email: 'user@example.com', password: 'password')

        visit discover_index_path

        click_link "Find Top Rated Movies" 
        expect(current_path).to eq(movies_path)
        expect(page).to have_content("Gabriel's Inferno Part III")
        expect(page).to have_content("Your Name.")
        expect(page).to have_content("City of God")
      end
    end
  end
end

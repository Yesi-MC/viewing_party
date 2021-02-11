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
        # expect(data.review_authors).to be_a(Array)
        # expect(data.review_contents).to be_a(Array)
        # expect(data.title).to eq("Lock, Stock and Two Smoking Barrels")
        # expect(data.vote_average).to eq(8.2)
        # expect(data.runtime).to eq(105)
        # expect(data.genres).to eq(["Comedy", "Crime"])
        # expect(data.overview).to eq("A card shark and his unwillingly-enlisted friends need to make a lot of cash quick after losing a sketchy poker match. To do this they decide to pull a heist on a small-time gang who happen to be operating out of the flat next door.")
        # expect(data.actor_names).to eq(["Jason Flemyng", "Dexter Fletcher", "Nick Moran", "Jason Statham", "Vinnie Jones", "Sting", "Steven Mackintosh", "Nicholas Rowe", "Lenny McLean", "P.H. Moriarty"])
        # expect(data.characters).to eq(["Tom", "Soap", "Eddie", "Bacon", "Big Chris", "JD", "Winston", "J", "Barry the Baptist", "'Hatchet' Harry Lonsdale"])
        # expect(data.review_authors).to eq(["BradFlix", "Andres Gomez", "David Perkins"])
        # expect(data.review_contents).to eq(["I just plain love this movie!", "Far from being a good movie, with tons of flaws but already pointing to the pattern of the whole Ritchie's filmography.", "Genuinely one of my favorite movies of all time. Watched again recently and realised how well written, brilliantly shot, beautifully cast and cleverly produced this movie actually is!"])
      end
    end
  end 
end 
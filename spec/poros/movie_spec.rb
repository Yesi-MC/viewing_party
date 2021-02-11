require 'rails_helper'

RSpec.describe Movie do
  it "it exists and has attributes" do
    movie = Movie.new({
                      :adult=>false,
                      :backdrop_path=>"/dIWwZW7dJJtqC6CgWzYkNVKIUm8.jpg",
                      :genre_ids=>[10749, 16, 18],
                      :id=>372058,
                      :original_language=>"ja",
                      :original_title=>"君の名は。",
                      :overview=>
                        "High schoolers Mitsuha and Taki are complete strangers living separate lives. But one night, they suddenly switch places. Mitsuha wakes up in Taki’s body, and he in hers. This bizarre occurrence continues to happen randomly, and the two must adjust their lives around each other.",
                      :popularity=>113.177,
                      :poster_path=>"/q719jXXEzOoYaps6babgKnONONX.jpg",
                      :release_date=>"2016-08-26",
                      :title=>"Your Name.",
                      :video=>false,
                      :vote_average=>8.6,
                      :vote_count=>7049
                      })

    expect(movie).to be_a(Movie) 
    expect(movie.title).to eq("Your Name.") 
    expect(movie.vote_average).to eq(8.6)                            
    expect(movie.id).to eq(372058)   
  end
end

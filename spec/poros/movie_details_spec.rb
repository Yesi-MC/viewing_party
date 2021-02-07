require 'rails_helper'

RSpec.describe MovieDetails do 
  it "it exists and has attributes" do 
    movie = {
            :adult=>false,
            :backdrop_path=>"/pkxPkHOPJjOvzfQOclANEBT8OfK.jpg",
            :belongs_to_collection=>{:id=>1241, :name=>"Harry Potter Collection", :poster_path=>"/eVPs2Y0LyvTLZn6AP5Z6O2rtiGB.jpg", :backdrop_path=>"/wfnMt6LGqYHcNyOfsuusw5lX3bL.jpg"},
            :budget=>150000000,
            :genres=>[{:id=>12, :name=>"Adventure"}, {:id=>14, :name=>"Fantasy"}, {:id=>9648, :name=>"Mystery"}],
            :homepage=>"https://www.warnerbros.com/movies/harry-potter-and-order-phoenix/",
            :id=>675,
            :imdb_id=>"tt0373889",
            :original_language=>"en",
            :original_title=>"Harry Potter and the Order of the Phoenix",
            :overview=>
              "Returning for his fifth year of study at Hogwarts, Harry is stunned to find that his warnings about the return of Lord Voldemort have been ignored. Left with no choice, Harry takes matters into his own hands, training a small group of students – dubbed 'Dumbledore's Army' – to defend themselves against the dark arts.",
            :popularity=>118.471,
            :poster_path=>"/s836PRwHkLjrOJrfW0eo7B4NJOf.jpg",
            :production_companies=>
              [{:id=>174, :logo_path=>"/ky0xOc5OrhzkZ1N6KyUxacfQsCk.png", :name=>"Warner Bros. Pictures", :origin_country=>"US"},
              {:id=>437, :logo_path=>"/nu20mtwbEIhUNnQ5NXVhHsNknZj.png", :name=>"Heyday Films", :origin_country=>"GB"}],
            :production_countries=>[{:iso_3166_1=>"GB", :name=>"United Kingdom"}, {:iso_3166_1=>"US", :name=>"United States of America"}],
            :release_date=>"2007-06-28",
            :revenue=>938212738,
            :runtime=>138,
            :spoken_languages=>[{:english_name=>"English", :iso_639_1=>"en", :name=>"English"}],
            :status=>"Released",
            :tagline=>"Evil Must Be Confronted.",
            :title=>"Harry Potter and the Order of the Phoenix",
            :video=>false,
            :vote_average=>7.7,
            :vote_count=>14345
            }

  actors = {
            :adult=>false,
            :gender=>2,
            :id=>10980,
            :known_for_department=>"Acting",
            :name=>"Daniel Radcliffe",
            :original_name=>"Daniel Radcliffe",
            :popularity=>11.79,
            :profile_path=>"/1XdM9LROLWnZrjXyRhf0jq0kJ3y.jpg",
            :cast_id=>22,
            :character=>"Harry Potter",
            :credit_id=>"52fe4268c3a36847f801c4db",
            :order=>0
            } 

  reviews = {
            :author=>"John Chard",
            :author_details=>{:name=>"", :username=>"John Chard", :avatar_path=>"/utEXl2EDiXBK6f41wCLsvprvMg4.jpg", :rating=>8.0},
            :content=>
            "Front and Centre for Dumbledore's Army.\r\n\r\nTerm 5 at Hogwarts for Harry and the gang and it's a deeply unsettling time. Harry faces getting expelled and finds himself shunned by many around him. This at a time when the Ministry of Magic compounds his misery by insisting to all and sundry that \"you know who\" is not back again.\r\n\r\nGiven that JK Rowling's fifth book is considered to be something of a door stopper, a book more of interim Potter filler than any great amount of substance, credit has to go to new to the franchise director, David Yates. For Yates and his screenwriter Michael Goldenberg have managed to craft a briskly entertaining segment in under 2 hours and 20 minutes of film. Yes it's safe to say that it ultimately does feel like an interim filler movie, one that is for fans and not newcomers to the series, but the effects are superb (except Grawp that is), the action is much and suspense is not in short supply. While it also finds Radcliffe as Potter finally hitting his acting stride.\r\n\r\nNew into the magical fray comes the wonderful Imelda Staunton as Dolores Umbrage, the sort of cheery psychotic teacher we all had bad dreams about in our formative years. Also most welcome is Helena Bonham Carter as nut job harpy Bellatrix Le Strange, it's an appetiser of substance and we can't wait to see some more of her from here on in. Of course the usual problem of not enough screen time for the regulars still exists, but it's now become a figure of grumpy acceptance in the grand scheme of Potter World. Neatly keeping the story trimmed of extraneous fat, Yates doesn't disappoint in delivering a last quarter as memorable as any so far in the series. Big rewards await those who wait, because the showdown that crowns Order of Phoenix is a magical mêlée of wands and wonderment; a face off between good and evil, a free for all that joyously assaults the senses.\r\n\r\nRoll on Half-Blood Prince, where it's great to know that Yates has been further entrusted with the Harry Potter reins. 7.5/10",
            :created_at=>"2019-08-20T23:40:20.626Z",
            :id=>"5d5c84e46743fa00116f04a2",
            :updated_at=>"2019-08-21T16:06:11.519Z",
            :url=>"https://www.themoviedb.org/review/5d5c84e46743fa00116f04a2"
            }

    movie_details = MovieDetails.new(movie, actors, reviews)             

    expect(movie_details).to be_a(MovieDetails)
    expect(movie_details.title).to eq("Harry Potter and the Order of the Phoenix") 
    expect(movie_details.vote_average).to eq(7.7)                            
    expect(movie_details.id).to eq(675)   
    expect(movie_details.genres).to eq([{:id=>12, :name=>"Adventure"}, {:id=>14, :name=>"Fantasy"}, {:id=>9648, :name=>"Mystery"}])   
    expect(movie_details.overview).to eq("Returning for his fifth year of study at Hogwarts, Harry is stunned to find that his warnings about the return of Lord Voldemort have been ignored. Left with no choice, Harry takes matters into his own hands, training a small group of students – dubbed 'Dumbledore's Army' – to defend themselves against the dark arts.")   
    expect(movie_details.name).to eq("Daniel Radcliffe")   
    expect(movie_details.character).to eq("Harry Potter")  
    expect(movie_details.author).to eq("John Chard")   
    expect(movie_details.content).to eq("Front and Centre for Dumbledore's Army.\r\n\r\nTerm 5 at Hogwarts for Harry and the gang and it's a deeply unsettling time. Harry faces getting expelled and finds himself shunned by many around him. This at a time when the Ministry of Magic compounds his misery by insisting to all and sundry that \"you know who\" is not back again.\r\n\r\nGiven that JK Rowling's fifth book is considered to be something of a door stopper, a book more of interim Potter filler than any great amount of substance, credit has to go to new to the franchise director, David Yates. For Yates and his screenwriter Michael Goldenberg have managed to craft a briskly entertaining segment in under 2 hours and 20 minutes of film. Yes it's safe to say that it ultimately does feel like an interim filler movie, one that is for fans and not newcomers to the series, but the effects are superb (except Grawp that is), the action is much and suspense is not in short supply. While it also finds Radcliffe as Potter finally hitting his acting stride.\r\n\r\nNew into the magical fray comes the wonderful Imelda Staunton as Dolores Umbrage, the sort of cheery psychotic teacher we all had bad dreams about in our formative years. Also most welcome is Helena Bonham Carter as nut job harpy Bellatrix Le Strange, it's an appetiser of substance and we can't wait to see some more of her from here on in. Of course the usual problem of not enough screen time for the regulars still exists, but it's now become a figure of grumpy acceptance in the grand scheme of Potter World. Neatly keeping the story trimmed of extraneous fat, Yates doesn't disappoint in delivering a last quarter as memorable as any so far in the series. Big rewards await those who wait, because the showdown that crowns Order of Phoenix is a magical mêlée of wands and wonderment; a face off between good and evil, a free for all that joyously assaults the senses.\r\n\r\nRoll on Half-Blood Prince, where it's great to know that Yates has been further entrusted with the Harry Potter reins. 7.5/10")   
  end
end
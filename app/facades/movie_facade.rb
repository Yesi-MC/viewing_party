class MovieFacade 

  def self.call_api_for_all_top_rated_movies 
    # conn = Faraday.new("https://api.themoviedb.org") #the connection is the URL
    # response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}") #this is the URI
    # response2 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=2") #this is the URI
    # data = JSON.parse(response.body, symbolize_names: true )
    # data2 = JSON.parse(response2.body, symbolize_names: true )
    # data[:results].concat(data2[:results])


    #do the facade first then refactor into the service 
    #after service is existing then do the following below 

    data = MovieService.top_rated_movies
    data.map { |movie| Movie.new(movie) }

    # iterating through will turn each movie hash into an object and it will contain 
    # only the attributes we turned into methods in the poros
  end

  def self.search_movie(movie_search) 
    data = MovieService.search_movie(movie_search)
    data.map { |movie| Movie.new(movie) } 
  end

  def self.api_movie_details(movie_id)
   
    # conn = Faraday.new("https://api.themoviedb.org")
    # response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['movie_api_key']}") 
    # @movie = JSON.parse(response.body, symbolize_names: true )

    # response2 = conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['movie_api_key']}") 
    # data = JSON.parse(response2.body, symbolize_names: true )
    # @actors = data[:cast][0..9]

    # response3 = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['movie_api_key']}") 
    # data_review = JSON.parse(response3.body, symbolize_names: true )
    # @reviews = data_review[:results]

    movie_data = MovieService.movie_details(movie_id)
    actor_data = MovieService.movie_cast(movie_id)
    review_data = MovieService.movie_reviews(movie_id)
    MovieDetails.new(movie_data, actor_data, review_data)
  end
end

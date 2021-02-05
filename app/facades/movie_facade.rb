class MovieFacade 

  def self.call_api_for_all_top_rated_movies 
    # conn = Faraday.new("https://api.themoviedb.org") #the connection is the URL
    # response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}") #this is the URI
    # response2 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=2") #this is the URI
    # data = JSON.parse(response.body, symbolize_names: true )
    # data2 = JSON.parse(response2.body, symbolize_names: true )
    # data[:results].concat(data2[:results])

    data = MovieService.top_rated_movies
    data.map { |movie| Movie.new(movie) }
  end
end
class MovieService 

  def self.top_rated_movies
    # conn = Faraday.new("https://api.themoviedb.org") #the connection is the URL
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}") 
    response2 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=2") 
    # data = JSON.parse(response.body, symbolize_names: true )
    data = parse_data(response) 
    # data2 = JSON.parse(response2.body, symbolize_names: true )
    data2 = parse_data(response2) 
    data[:results].concat(data2[:results])
    
  end

  def self.conn 
    Faraday.new("https://api.themoviedb.org") 

  end

  def self.parse_data(response) 
    JSON.parse(response.body, symbolize_names: true )
  end 
end
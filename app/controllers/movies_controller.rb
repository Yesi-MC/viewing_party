class MoviesController < ApplicationController 

  def index  #(top rated) will go to the index views 
    conn = Faraday.new("https://api.themoviedb.org") #the connection is the URL
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}") #this is the URI
    response2 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=2") #this is the URI
    data = JSON.parse(response.body, symbolize_names: true )
    data2 = JSON.parse(response2.body, symbolize_names: true )
    @movies = data[:results].concat(data2[:results])
  
  end

  def search #the find movies by search term will go 
    movie_search = params[:movie] 
    conn = Faraday.new("https://api.themoviedb.org") 
    response = conn.get("/3/search/movie?api_key=#{ENV['movie_api_key']}&query=#{movie_search}") 
    # response2 = conn.get("/3/search/movie?api_key=#{ENV['movie_api_key']}&query=#{movie_search}&page=2") #this is the URI 
    response2 = conn.get("/3/search/movie") do |req| #this is the same as the response2 commenteed out 
      req.params['api_key'] = ENV['movie_api_key']
      req.params['query'] = movie_search
      req.params['page'] = 2
    end 
    data = JSON.parse(response.body, symbolize_names: true )
    data2 = JSON.parse(response2.body, symbolize_names: true )
    @movies = data[:results].concat(data2[:results])
  end

  def details 
    movie_id = params[:id] 
    conn = Faraday.new("https://api.themoviedb.org")
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['movie_api_key']}") 
    @movie = JSON.parse(response.body, symbolize_names: true )

  end
end


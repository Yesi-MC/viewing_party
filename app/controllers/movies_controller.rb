class MoviesController < ApplicationController 

  def index  #(top rated) will go to the index views 
    # conn = Faraday.new("https://api.themoviedb.org") #the connection is the URL
    # response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}") #this is the URI
    # response2 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&page=2") #this is the URI
    # data = JSON.parse(response.body, symbolize_names: true )
    # data2 = JSON.parse(response2.body, symbolize_names: true )
    # @movies = data[:results].concat(data2[:results])
  
    @movies = MovieFacade.call_api_for_all_top_rated_movies 
  end

  def search
    movie_search = params[:movie] 
    # # response2 = conn.get("/3/search/movie") do |req| #this is the same as the response2 
    # #   req.params['api_key'] = ENV['movie_api_key']
    # #   req.params['query'] = movie_search
    # #   req.params['page'] = 2
    # # end 
    @movies = MovieFacade.search_movie(movie_search) 
  end

  def details 
    movie_id = params[:id] 
    # conn = Faraday.new("https://api.themoviedb.org")
    # response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['movie_api_key']}") 
    # @movie = JSON.parse(response.body, symbolize_names: true )

    # response2 = conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['movie_api_key']}") 
    # data = JSON.parse(response2.body, symbolize_names: true )
    # @actors = data[:cast][0..9]

    # response3 = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['movie_api_key']}") 
    # data_review = JSON.parse(response3.body, symbolize_names: true )
    # @reviews = data_review[:results]
    
  end
end


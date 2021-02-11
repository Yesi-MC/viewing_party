class MovieFacade 

  def self.call_api_for_all_top_rated_movies 
    data = MovieService.top_rated_movies
    data.map { |movie| Movie.new(movie) }
  end

  def self.search_movie(movie_search) 
    data = MovieService.search_movie(movie_search)
    data.map { |movie| Movie.new(movie) } 
  end

  def self.api_movie_details(movie_id)
    movie_data = MovieService.movie_details(movie_id)
    actor_data = MovieService.movie_cast(movie_id)
    review_data = MovieService.movie_reviews(movie_id)
    MovieDetails.new(movie_data, actor_data, review_data)
  end
end

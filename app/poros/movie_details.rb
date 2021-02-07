class MovieDetails 
  attr_reader :id, 
              :title, 
              :vote_average, 
              :genres,
              :overview,
              :name, 
              :character,
              :author,
              :content

  def initialize(movie_data, actor_data, review_data)
    
    @id = movie_data[:id]
    @title = movie_data[:title]
    @vote_average = movie_data[:vote_average]
    @genres = movie_data[:genres]
    @overview = movie_data[:overview]
    @name = actor_data[:name]
    @character = actor_data[:character]
    @author = review_data[:author]
    @content = review_data[:content]
  end
end
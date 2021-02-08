class MovieDetails 
  attr_reader :id, 
              :title, 
              :vote_average, 
              :genres,
              :overview,
              :runtime,
              :actor_names, 
              :characters,
              :review_authors,
              :review_contents

  def initialize(movie_data, actor_data, review_data)
    
    @id = movie_data[:id]
    @title = movie_data[:title]
    @vote_average = movie_data[:vote_average]
    @genres = movie_data[:genres].map { |genre| genre[:name]} 
    @overview = movie_data[:overview]
    @runtime = movie_data[:runtime]
    @actor_names = actor_data.map { |actor| actor[:name] }
    @characters = actor_data.map { |actor| actor[:character] }
    @review_authors = review_data.map { |review| review[:author] }
    @review_contents = review_data.map { |review| review[:content] }
  end
end
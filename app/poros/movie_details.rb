class MovieDetails
  attr_reader :id,
              :title,
              :vote_average,
              :genres,
              :overview,
              :runtime,
              :actors,
              :reviews

  def initialize(movie_data, actor_data, review_data)
    @id = movie_data[:id]
    @title = movie_data[:title]
    @vote_average = movie_data[:vote_average]
    @genres = movie_data[:genres].map { |genre| genre[:name] }
    @overview = movie_data[:overview]
    @runtime = movie_data[:runtime]
    @actors = find_actors(actor_data)
    @reviews = find_reviews(review_data)
  end

  def find_actors(actor_data)
    actor_data.map do |actor|
      {
        name: actor[:name],
        character: actor[:character]
      }
    end
  end

  def find_reviews(review_data)
    review_data.map do |review|
      {
        author: review[:author],
        content: review[:content]
      }
    end
  end
end

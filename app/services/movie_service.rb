class MovieService
  class << self
    def top_rated_movies
      response = conn.get('/3/movie/top_rated?')
      response2 = conn.get('/3/movie/top_rated?&page=2')
      data = parse_data(response)
      data2 = parse_data(response2)
      data[:results].concat(data2[:results])
    end

    def search_movie(movie_search)
      response = conn.get("/3/search/movie?&query=#{movie_search}")
      response2 = conn.get("/3/search/movie?&query=#{movie_search}&page=2")
      data = parse_data(response)
      data2 = parse_data(response2)
      data[:results].concat(data2[:results])
    end

    def movie_details(movie_id)
      response = conn.get("/3/movie/#{movie_id}?")
      parse_data(response)
    end

    def movie_cast(movie_id)
      response = conn.get("/3/movie/#{movie_id}/credits?")
      data = JSON.parse(response.body, symbolize_names: true)
      data[:cast][0..9]
    end

    def movie_reviews(movie_id)
      response = conn.get("/3/movie/#{movie_id}/reviews?")
      data_review = JSON.parse(response.body, symbolize_names: true)
      data_review[:results]
    end
  end

  def self.conn
    Faraday.new('https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end

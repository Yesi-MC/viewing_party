class Movie # this is for the index and the search 
  attr_reader :id,
              :title,
              :vote_average

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
  end
end

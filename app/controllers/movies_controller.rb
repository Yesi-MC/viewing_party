class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.call_api_for_all_top_rated_movies
  end

  def search
    movie_search = params[:movie]
    if movie_search == ""
      flash[:notice] = "Please Enter a Movie Title"
      redirect_to discover_index_path
    else 
      @movies = MovieFacade.search_movie(movie_search)
    end
  end

  def details 
    @movie_details = MovieFacade.api_movie_details(params[:id])
    session[:title] = @movie_details.title
    session[:runtime] = @movie_details.runtime
  end
end

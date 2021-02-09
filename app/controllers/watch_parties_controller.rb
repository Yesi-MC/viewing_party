class WatchPartiesController < ApplicationController
  def new
    @movie = MovieFacade.api_movie_details(params[:movie_id])
  end

  # def create  

  # end

  # def show 

  # end

end 
class WatchPartiesController < ApplicationController
  def new
    @friends = current_user.friends
    @watch_party = WatchParty.new(movie_title: session[:title], duration: session[:runtime])
  end

  def create
    #require 'pry'; binding.pry
    redirect_to dashboard_path(session[:user_id])
  end
end
class WatchPartiesController < ApplicationController
  def new
    @friends = current_user.friends
    @watch_party = WatchParty.new(movie_title: session[:title], duration: session[:runtime])
  end
end
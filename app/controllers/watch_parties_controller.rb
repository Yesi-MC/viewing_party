class WatchPartiesController < ApplicationController
  def new
    @watch_party = WatchParty.new(movie_title: session[:title], duration: session[:runtime])
  end
end
class WatchPartiesController < ApplicationController
  def new
    @friends = current_user.friends
    @watch_party = WatchParty.new(movie_title: session[:title], duration: session[:runtime])
  end

  def create
    @watch_party = WatchParty.new(watch_party_params)
    if current_user.same_day(params[:date], params[:time])
      flash[:error] = "You have scheduled another party at this time and date. Please try again."
      redirect_to new_watch_party_path(current_user)
    elsif @watch_party.duration < session[:runtime]
      flash[:error] = "The party cannot end before the length of the movie. Please try again."
    elsif @watch_party.update(movie_title: session[:title], user_id: session[:user_id]) && @watch_party.valid_party(watch_party_params["date"])
      flash[:success] = "Party has been created!"
      @watch_party.save
      redirect_to dashboard_path(current_user)
    else
      flash[:error] = "Update failed"
      redirect_to new_watch_party_path(current_user)
    end
  end

  private

  def watch_party_params
    params.require(:watch_party).permit(:date, :time, :duration, :movie_title)
  end
end

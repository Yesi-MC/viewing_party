class WatchPartiesController < ApplicationController
  def new
    @friends = current_user.friends
    @watch_party = WatchParty.new(movie_title: session[:title], duration: session[:runtime])
  end

  def create
    @watch_party = WatchParty.new(watch_party_params)
    if current_user.any_same_date_party?(@watch_party.date)
      flash[:error] = "You are already hosting another party at this date. Please change the date"
      redirect_to new_watch_party_path(current_user)
    elsif
      flash[:error] = "Update failed"
      redirect_to new_watch_party_path(current_user)
    else @watch_party.update!(movie_title: session[:title], user_id: session[:user_id]) && @watch_party.valid_party(watch_party_params["date"])
        flash[:success] = "Party has been created!"
        @watch_party.save
        redirect_to dashboard_path(current_user)
    end
  end

  private

  def watch_party_params
    params.require(:watch_party).permit(:date, :time, :duration, :movie_title)
  end
end

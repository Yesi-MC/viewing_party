class WelcomeController < ApplicationController

  def index
    if current_user
      redirect_to "/users/#{@current_user.id}/dashboard"
    end
  end
end

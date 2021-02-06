class WelcomeController < ApplicationController
  def index
    redirect_to "/users/#{@current_user.id}/dashboard" if current_user
  end
end

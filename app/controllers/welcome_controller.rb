class WelcomeController < ApplicationController
  def index
    redirect_to dashboard_path(current_user) if current_user
  end
end

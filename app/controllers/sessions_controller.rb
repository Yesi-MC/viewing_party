class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}"

      redirect_to "/users/#{user.id}/dashboard"
    else
      flash[:error] = 'Invalid credentials, please try again.'
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end

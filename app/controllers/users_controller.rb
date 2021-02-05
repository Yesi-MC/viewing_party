class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    flash[:success] = "Welcome, #{new_user.email}"

    redirect_to "/users/#{new_user.id}/dashboard"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

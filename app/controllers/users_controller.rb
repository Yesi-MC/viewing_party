class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      flash[:success] = "Welcome, #{new_user.email}"
      redirect_to "/users/#{new_user.id}/dashboard"
    else
      flash[:error] = 'Invalid credentials, please try again.'
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

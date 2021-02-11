class UsersController < ApplicationController
  before_action :downcase_email, except: :new

  def new
    @user = User.new
  end

  def create
    user_params[:email] = user_params[:email].downcase
    new_user = User.new(user_params)
    if new_user.save && EmailAddress.valid?(new_user.email)
      session[:user_id] = new_user.id
      RegistrationNotifierMailer.welcome(new_user).deliver_now
      flash[:success] = "Welcome, #{new_user.email}"
      redirect_to dashboard_path(current_user)
    else
      flash[:error] = 'Invalid credentials, please try again.'
      redirect_to new_user_path
    end
  end

  private

  def downcase_email
    user = user_params
    user[:email] = user[:email].downcase
    @new_user = User.new(user)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

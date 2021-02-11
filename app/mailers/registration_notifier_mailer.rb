class RegistrationNotifierMailer < ApplicationMailer
  def welcome(user)
    @user = user
    @url = "https://fun-movie-night.herokuapp.com/discover"
    mail(
      to: user.email,
      subject: "Thank you for registering to Fun Movie Nights!"
    )
  end
end

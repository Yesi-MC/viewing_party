require 'rails_helper'

RSpec.describe RegistrationNotifierMailer, type: :mailer do
  describe 'welcome' do
    sending_user = User.create(email: "testing@email.com", password: "testing")

    let(:mail) { RegistrationNotifierMailer.welcome(sending_user) }

    it 'renders the headers' do
      expect(mail.subject).to eq("Thank you for registering to Fun Movie Nights!")
      expect(mail.to).to eq([sending_user.email])
      expect(mail.from).to eq(["afunmovienight@gmail.com"])
    end

    url = "https://fun-movie-night.herokuapp.com/discover"

    it 'renders the body' do
      expect(mail.text_part.body.to_s).to include("Congratulations on creating an account on Fun Movie Nights, #{sending_user.email}")
      expect(mail.text_part.body.to_s).to include("Check out our top movies at #{url}")

      expect(mail.html_part.body.to_s).to include("Congratulations on creating an account on Fun Movie Nights, #{sending_user.email}")
      expect(mail.html_part.body.to_s).to include("Check out our top movies at #{url}")

      expect(mail.body.encoded).to include("Congratulations on creating an account on Fun Movie Nights, #{sending_user.email}")
      expect(mail.body.encoded).to include("Check out our top movies at #{url}")
    end
  end
end
require 'rails_helper'

RSpec.describe 'Dashboard Index' do
  before :each do
    @user = User.create!(email: 'Test@Test.com', password: 'Test')
  end
  describe 'Initial Visit' do
    it 'can see user email, Discover Movies button, Friends section, and Viewing Parties' do
      #login first, then get rid of visit action in order to pass authentication
      visit dashboard_index_path

      expect(page).to have_content("Welcome #{@user.email}!")
      expect(page).to have_button("Discover Movies")
      within('section.friends-list') do
        expect(page).to have_content("Add friends to your friends list!")
      end
    end
  end
end
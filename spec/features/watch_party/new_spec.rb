require 'rails_helper'

describe 'As a user when I visit "/watching_party/new" 'do
  it 'can create a watch party' do
    VCR.suse_cassette('movie details')
    user = User.create(email: 'user@gmail.com', password: 'password')
    user2 = User.create(email: 'user2@gmail.com', password: 'password2')
    user3 = User.create(email: 'user3@gmail.com', password: 'password3')

    friendship = user.friendships.create(friend_id: user2.id )
    friendship = user.friendships.create(friend_id: user3.id )

    visit login_path

    fill_in :email, with: "user@gmail.com"
    fill_in :password, with: "password"

    click_button 'Log In'

    visit watch_parties_new_path

    expect(page).to have_content('Movie Title')
    expect(page).to have_content('Duration of Party')
    expect(page).to have_content('Day')
    expect(page).to have_content('Start Time')
    expect(page).to have_content('Invite Friends')
    # expect(page).to have_link('I have an account')
    # expect(page).to have_link('Sign Up')


    fill_in "Duration of Party", with: 180
    fill_in "Day", with: "12/12/20"
    fill_in "Start Time", with: "1:00"
    check "user2"
    check "user3"

    click_button "Create Party"

    expect(current_path).to eq(dashboard_path)
  end
end 
#   it "can create the party"

#     visit watch_party_path

#     expect(page).to have_button('Create Party')
# end

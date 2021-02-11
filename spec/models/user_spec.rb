require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many :friendships }
    it { should have_many(:friends).through(:friendships) }
    it { should have_many :watch_parties }
  end
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
  end
  describe 'instance methods' do
    it '#party_host' do
      user = User.create(email: "user@user.com", password: "password")
      watch_party_1 = user.watch_parties.create(user_id: user.id, movie_title: "Test", date: "Today", time: "10:00 AM", duration: 20)
    
      expect(user.party_host).to eq([watch_party_1])

      watch_party_2 = user.watch_parties.create(user_id: user.id, movie_title: "Test1", date: "Today1", time: "11:00 AM", duration: 201)

      expect(user.party_host).to eq([watch_party_1, watch_party_2])
    end
    it '#dates_of_all_watch_parties' do
      user = User.create(email: "user@user.com", password: "password")
      watch_party_1 = user.watch_parties.create(user_id: user.id, movie_title: "Test", date: "Today", time: "10:00 AM", duration: 20)
      watch_party_2 = user.watch_parties.create(user_id: user.id, movie_title: "Test1", date: "Today1", time: "11:00 AM", duration: 201)

      expect(user.dates_of_all_my_hosted_watch_parties).to eq(["Today", "Today1"])
    end
    it '#dates_of_all_watch_parties' do
      user = User.create(email: "user@user.com", password: "password")
      watch_party_1 = user.watch_parties.create(user_id: user.id, movie_title: "Test", date: "Today", time: "10:00 AM", duration: 20)

      expect(user.any_same_date_party?("Today")).to eq(true)
      expect(user.any_same_date_party?("Today1")).to eq(false)
    end
    it 'parties_invited_to' do
      user = User.create(email: "user@user.com", password: "password")
      attendee_1 = User.create(email: "user1@user.com", password: "password")
      attendee_2 = User.create(email: "user2@user.com", password: "password")

      watch_party_1 = user.watch_parties.create(user_id: user.id, movie_title: "Test", date: "Today", time: "10:00 AM", duration: 20)
      watch_party_2 = user.watch_parties.create(user_id: user.id, movie_title: "Test1", date: "Today1", time: "11:00 AM", duration: 201)

      Guest.create(watch_party_id: watch_party_1.id, invitee_id: attendee_1.id)
      Guest.create(watch_party_id: watch_party_2.id, invitee_id: attendee_1.id)
      expect(attendee_1.parties_invited_to).to eq([watch_party_1, watch_party_2])
      expect(attendee_2.parties_invited_to).to eq([])
    end
    it '#same_day' do
      user = User.create(email: "user@user.com", password: "password")
      watch_party_1 = user.watch_parties.create(user_id: user.id, movie_title: "Test", date: "02-20-2021", time: "10:00 AM", duration: 20)
      
      expect(user.same_day(watch_party_1.date, watch_party_1.time)).to eq(true)
    end
  end
end

require 'rails_helper'

RSpec.describe WatchParty do
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :guests }
    it { should have_many(:invitees).through(:guests) }
  end
  describe 'validations' do
    it { should validate_presence_of :date }
    it { should validate_presence_of :time }
    it { should validate_presence_of :duration }
    it { should validate_numericality_of(:duration) }
    it { should validate_presence_of :movie_title }
  end
  describe 'instance methods' do
    it '#valid_party' do
      user = User.create(email: "email@email.com", password: "password")
      watch_party_1 = WatchParty.create(user_id: user.id, movie_title: "Test", date: "09-02-2021", time: "10:00 AM", duration: 20)

      expect(watch_party_1.valid_party(watch_party_1.date)).to eq(false)

      watch_party_2 = WatchParty.create(user_id: user.id, movie_title: "Test", date: "09-02-2030", time: "10:00 AM", duration: 20)

      expect(watch_party_2.valid_party(watch_party_2.date)).to eq(true)
    end
    xit '#valid_party_time' do

    end
  end
end

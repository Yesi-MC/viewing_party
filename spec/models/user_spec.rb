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
    it 'party_host' do
      user = User.create(email: "user@user.com", password: "password")
      watch_party_1 = user.watch_parties.create(user_id: user.id, movie_title: "Test", date: "Today", time: "10:00 AM", duration: 20)
    
      expect(user.party_host).to eq([watch_party_1])

      watch_party_2 = user.watch_parties.create(user_id: user.id, movie_title: "Test1", date: "Today1", time: "11:00 AM", duration: 201)

      expect(user.party_host).to eq([watch_party_1, watch_party_2])
    end
  end
end

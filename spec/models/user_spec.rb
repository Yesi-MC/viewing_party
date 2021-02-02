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
end

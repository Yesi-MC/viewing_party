class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :watch_parties, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  def party_host
    watch_parties
  end

  def dates_of_all_watch_parties
    party_host.select("watch_parties.date").pluck(:date)
  end
end

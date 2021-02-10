class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :watch_parties, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  # Methods for Party Host Users
  def party_host
    watch_parties
  end

  def dates_of_all_my_hosted_watch_parties
    party_host.select("watch_parties.date").pluck(:date)
  end

  def any_same_date_party?(new_party_date)
    return true if dates_of_all_my_hosted_watch_parties.include?(new_party_date)
    false
  end

  # Methods for Guest Users

  def parties_invited_to
    WatchParty.joins(:guests)
    .where("guests.invitee_id = ?", self.id)
  end
end

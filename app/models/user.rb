class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, required: true

  has_many :watch_parties
  has_many :friendships
  has_many :friends, through: :friendships
end

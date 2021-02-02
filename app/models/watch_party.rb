class WatchParty < ApplicationRecord
  validates_presence_of :date, :time, :duration, :movie_title
  validates_numericality_of :duration, only_integer: true, greater_than: 0

  belongs_to :user
  has_many :guests
  has_many :invitees, through: :guests
end
class WatchParty < ApplicationRecord
  validates :date, :time, :duration, :movie_title, presence: true
  # validates :duration, numericality: { only_integer: true }
  validates_numericality_of :duration, :greater_than => 0


  belongs_to :user
  has_many :guests, dependent: :destroy
  has_many :invitees, through: :guests


  def valid_party(date)
    date > Time.now
  end

end

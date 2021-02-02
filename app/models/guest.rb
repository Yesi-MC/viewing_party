class Guest < ApplicationRecord
  belongs_to :watch_party
  belongs_to :invitee, class_name: 'User'
end

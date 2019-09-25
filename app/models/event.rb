class Event < ApplicationRecord
  belongs_to :creator,  foreign_key: 'creator_id', class_name: 'User'
  has_many   :attendees, foreign_key: 'attendee_id', through: :attendances #, source: :user
  has_many   :attendances
end

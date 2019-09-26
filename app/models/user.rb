class User < ApplicationRecord
  has_many :events,      foreign_key: 'creator_id'                            # is the organizer of the event
  has_many :attendances, foreign_key: 'attendee_id'

  has_many :attendees,   foreign_key: 'attendee_id',   through: :attendances  # is attending the event

  has_many :attended_events,   through: :attendances # is attending the event
  # has_many :users,       foreign_key: 'invited_by_id', through: :attendances  # who invited him/her
  # has_many :users,       foreign_key: 'invited_by_id', through: :attendances  # who he/her has invited
end

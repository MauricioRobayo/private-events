# frozen_string_literal: true

class Attendance < ApplicationRecord
  before_validation do |attendance|
    attendance.invited_by = attendance.attendee if attendance.invited_by.nil?
  end

  belongs_to :attendee, class_name: :User
  belongs_to :invited_by, class_name: :User
  belongs_to :attended_event, class_name: :Event, foreign_key: :event_id

  validates :invited_by, presence: false
end

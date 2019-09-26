class Attendance < ApplicationRecord
  belongs_to :attendee,       class_name: :User
  belongs_to :invited_by,     class_name: :User
  belongs_to :attended_event, class_name: :Event, foreign_key: :event_id
end

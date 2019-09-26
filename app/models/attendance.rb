class Attendance < ApplicationRecord
  belongs_to :attendee,   foreign_key: 'attendee_id',   class_name: "User"
  belongs_to :invited_by, foreign_key: 'invited_by_id', class_name: "User"

  belongs_to :attended_event, class_name: :Event, foreign_key: :event_id
end

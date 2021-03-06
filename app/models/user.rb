# frozen_string_literal: true

class User < ApplicationRecord
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :events, foreign_key: 'creator_id'

  has_many :attendees, through: :attendances
  has_many :attended_events, through: :attendances

  validates :username, uniqueness: true, presence: true

  def attending?(event)
    attended_events.include?(event)
  end
end

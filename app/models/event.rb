# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :attendances

  belongs_to :creator, class_name: :User
  has_many :attendees, class_name: :User, through: :attendances

  scope :upcoming, -> { where("date >= date('now')") }
  scope :previous, -> { where("date <  date('now')") }
end

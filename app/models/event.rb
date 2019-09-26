# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :attendances
  has_many :attendees, foreign_key: 'attendee_id', class_name: 'User', through: :attendances # , source: :user
end

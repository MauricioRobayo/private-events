# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

4.times do
  User.create(username: Faker::Name.unique.first_name)
end

users = User.all

users.each do |user|
  rand(4).times do
    user.events.create(description: Faker::Hipster.sentence, date: Faker::Date.forward(days: 30)) do |event|
      users.sample(2).each do |attendee|
        attendee.attendances.create(attended_event: event, invited_by: user) if attendee.id != user.id
      end
    end
  end
end

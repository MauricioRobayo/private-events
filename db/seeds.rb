# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
  User.create(username: Faker::Name.unique.first_name).tap do |user|
    rand(20).times do
      Event.create(description: Faker::Hipster.sentence, date: Faker::Date.forward(days: 30), creator_id: user.id)
    end
  end
end

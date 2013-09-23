require 'rubygems'
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do |i|
  Ticket.create(
      carrier: Faker::Company.name,
      price: Time.now.to_i + Random.rand(100),
      departure: Time.now,
      arrival: Time.now + 2.week
  )
end

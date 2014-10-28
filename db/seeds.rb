# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Activity.destroy_all

activities = Activity.create([{ name: 'Hiking'}, { name: 'Running'}, { name: 'Yoga'}, { name: 'Rock-climbing'}, { name: 'Biking'}, { name: 'Kayaking'}])

admin = User.create(username: 'ruchi', email: 'rmalik2788@gmail.com', password: "logme1234", password_confirmation: "logme1234", location: 'Washington DC', admin: true)


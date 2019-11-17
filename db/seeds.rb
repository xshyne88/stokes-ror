# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: 'chase@chase.com',
  name: "Chase Philips",
  password: 'abc12345'
)

User.create(
  email: 'zhenson1989@gmail.com',
  name: "Zach Henson",
  password: 'abc12345',
  admin: true
)


trash = Duty.create!(name: 'Trash Removed', description: 'Remove all trash and debris')
mowed = Duty.create!(name: 'Mowed', description: 'Entire grass area mown correctly')
weeds = Duty.create!(name: 'Weed Eaten', description: 'Remove all weeds')
trees = Duty.create!(name: 'Trees Kempt', description: 'Use best judgement and water prune and cut foliage')
roads = Duty.create!(name: 'Roads Cleared', description: 'Clean the roads surrounding or touching the area')
posts = Duty.create!(name: 'Posts Maintained', description: 'Take care of the green posts')
signs = Duty.create!(name: 'Signs made Visible', description: 'Maintain cleanliness of signs')

cdi = Land.create!(name: 'CD Outer', latitude: '28.51356', longitude: '-81.42964874797077')
cdo = Land.create!(name: 'CD Inner', latitude: '28.5136', longitude: '-81.4288')
ef = Land.create!(name: 'EF', latitude: '28.5138', longitude: '-81.4284')

a = Land.create!(name: 'A', latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
g = Land.create!(name: 'G', latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
h = Land.create!(name: 'H', latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
j = Land.create!(name: 'J', latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
k = Land.create!(name: 'K', latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
l = Land.create!(name: 'L', latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
m = Land.create!(name: 'M', latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
n = Land.create!(name: 'N', latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
p = Land.create!(name: 'P', latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
r = Land.create!(name: 'R', latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
s = Land.create!(name: 'S', latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)

Land.all.each { |land|
  [trash, mowed, weeds].each { |duty|
    LandDuty.create(land: land, duty: duty)
  }
}


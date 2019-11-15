# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  email: 'chase@chase.com',
  password: 'abc12345'
)

User.create(
  email: 'zhenson1989@gmail.com',
  password: 'abc12345',
  admin: true
)


trash = Duty.create!(name: 'Pick up trash', description: 'Remove all trash and debris')
mowed = Duty.create!(name: 'Mowed', description: 'Entire grass area mown correctly')
weeds = Duty.create!(name: 'Weed Eaten', description: 'Remove all weeds')
trees = Duty.create!(name: 'Trees watered pruned and cut', description: 'Use best judgement and water prune and cut foliage')
roads = Duty.create!(name: 'Access Roads cleaned and maintained', description: 'Clean the roads surrounding or touching the area')
posts = Duty.create!(name: 'Green Post maintenance', description: 'Take care of the green posts')
signs = Duty.create!(name: 'Cemetary Signs are in place and visible', description: 'Maintain cleanliness of signs')

cdi = Land.create!(name: 'CD Outer', latitude: '28.51356', longitude: '-81.42964874797077')
cdo = Land.create!(name: 'CD Inner', latitude: '28.5136', longitude: '-81.4288')
ef = Land.create!(name: 'EF', latitude: '28.5138', longitude: '-81.4284')

LandDuty.create!(land: ef, duty: trash, estimated_days: 14)
LandDuty.create!(land: ef, duty: mowed, estimated_days: 14)
LandDuty.create!(land: ef, duty: weeds, estimated_days: 14)
LandDuty.create!(land: ef, duty: signs, estimated_days: 14)

LandDuty.create!(land: cdi, duty: trash, estimated_days: 14)
LandDuty.create!(land: cdi, duty: mowed, estimated_days: 14)
LandDuty.create!(land: cdi, duty: weeds, estimated_days: 14)
LandDuty.create!(land: cdi, duty: signs, estimated_days: 14)

LandDuty.create(land: cdo, duty: trash, estimated_days: 14)
LandDuty.create(land: cdo, duty: mowed, estimated_days: 14)
LandDuty.create(land: cdo, duty: weeds, estimated_days: 14)
LandDuty.create(land: cdo, duty: signs, estimated_days: 14)

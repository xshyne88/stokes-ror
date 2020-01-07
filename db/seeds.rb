# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chase = User.create!(
  email: "chase",
  name: "Chase Philips",
  password: "abc12345",
  admin: true
)

Audited.audit_class.as_user(chase) do
  User.create!(
    email: "zach",
    name: "Zach Henson",
    password: "abc12345",
    admin: true
  )

  User.create!(
    email: "jay",
    name: "Jay",
    password: "jay12345",
    admin: false
  )

  User.create!(
    email: "shay",
    name: "Shay",
    password: "shay12345",
    admin: false
  )

  User.create!(
    email: "amp",
    name: "Amp",
    password: "amp12345",
    admin: false
  )

  User.create!(
    email: "cliff",
    name: "Cliff",
    password: "cliff12345",
    admin: false
  )

  User.create!(
    email: "guest",
    name: "Guest",
    password: "guest12345",
    admin: false
  )

  trash = Duty.create!(name: "Trash Removed", description: "Remove all trash and debris")
  mowed = Duty.create!(name: "Mowed", description: "Entire grass area mown correctly")
  weeds = Duty.create!(name: "Weed-Eaten", description: "Remove all weeds")
  trees = Duty.create!(name: "Trees Kempt", description: "Use best judgement and water prune and cut foliage")
  roads = Duty.create!(name: "Roads Cleared", description: "Clean the roads surrounding or touching the area")
  posts = Duty.create!(name: "Posts Maintained", description: "Take care of the green posts")
  signs = Duty.create!(name: "Signs made Visible", description: "All signs are in place, upright and visible")

  cdi = Land.create!(name: "CD Outer", latitude: "28.51356", longitude: "-81.42964874797077")
  cdo = Land.create!(name: "CD Inner", latitude: "28.5136", longitude: "-81.4288")
  ef = Land.create!(name: "EF", latitude: "28.5138", longitude: "-81.4284")
  vl = Land.create!(name: "Vacant Land", latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  off = Land.create!(name: "Office", latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)

  a = Land.create!(name: "A", latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  b = Land.create!(name: "B", latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  g = Land.create!(name: "G", latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  h = Land.create!(name: "H", latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  j = Land.create!(name: "J", latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  k = Land.create!(name: "K", latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  l = Land.create!(name: "L", latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  m = Land.create!(name: "M", latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  n = Land.create!(name: "N", latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  p = Land.create!(name: "P", latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  r = Land.create!(name: "R", latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  s = Land.create!(name: "S", latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)

  LandDuty.create!(land: cdo, duty: posts)
  LandDuty.create!(land: cdi, duty: posts)
  LandDuty.create!(land: ef, duty: posts)
  LandDuty.create!(land: g, duty: posts)

  LandDuty.create!(land: cdo, duty: signs)
  LandDuty.create!(land: cdi, duty: signs)
  LandDuty.create!(land: ef, duty: signs)
  LandDuty.create!(land: n, duty: signs)
  LandDuty.create!(land: p, duty: signs)
  LandDuty.create!(land: r, duty: signs)
  LandDuty.create!(land: s, duty: signs)

  LandDuty.create!(land: b, duty: trash)
  LandDuty.create!(land: b, duty: mowed)
  LandDuty.create!(land: b, duty: weeds)

  Land.all.each do |land|
    [trash, mowed, weeds].each do |duty|
      LandDuty.create!(land: land, duty: duty)
    end
  end
end

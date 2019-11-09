# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  email: "chase@chase.com",
  password: "abc12345"
)

Land.create(name: "Land CD Outer", latitude="28.51356", longitude="-81.42964874797077")
Land.create(name: "Land 2")
Land.create(name: "Land 3")
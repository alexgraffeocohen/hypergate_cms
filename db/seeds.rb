# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create([
  { name: "Weird" },
  { name: "Trader" },
  { name: "Desert Planet" },
  { name: "Oceanic Planet" },
  { name: "Habitable Planet" },
  { name: "Gas Giant" },
  { name: "Derelict Ship" },
  { name: "Capital Ship" },
  { name: "Military Ship" },
  { name: "Other" },
])

Role.create([
  { name: "Communications Officer" },
  { name: "Weapons Officer" },
  { name: "Science Officer" },
  { name: "Medical Officer" },
  { name: "Engineer" },
  { name: "Pilot" },
])


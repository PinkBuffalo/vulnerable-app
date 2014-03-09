# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

david = User.create name: 'dave', email: 'david@email.com'

david.stories.create [
  { body: 'This is the first story of my life'},
  { body: 'Whoa, Vuln is great! Who\'s reading me ?' }
]

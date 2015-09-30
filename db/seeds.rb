# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["Kitchen","Internet","TV","Heating","Air Conditioning", "Washer", "Dryer", "Gym", "Guest Parking", "Internet", "Pets Allowed", "Elevator", "Smoking", "Wheelchair Accessible"].each do |feature|
  Feature.create(tag: feature)
end

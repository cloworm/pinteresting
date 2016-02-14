# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Adding tags..."

tags = [
  ["3d printer", "machine"],
  ["vinyl cutter", "machine"],
  ["cnc mill", "machine"],
  ["wire bender", "machine"],
  ["3d scanner", "machine"],
  ["laser cutter", "machine"],
  ["router", "machine"],
  ["bristol uk", "place"],
  ["suwa japan", "place"],
  ["wayne usa", "place"],
  ["willich germany", "place"],
]

tags.each do |(name, category)|
  Tag.create(name: name, category: category)
end

puts "DONE!"

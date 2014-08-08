# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Spot.delete_all
Spot.create!(name: 'Soma Bay', latitude: 26.844535, longitude: 33.956664, 
	sport: 1, seasons: '002001000')

Spot.create!(name: 'El Gouna', latitude: 27.396147, longitude: 33.687928, 
	sport: 1, seasons: '')

Spot.create!(name: 'Sharm el Sheikh, Nabq', latitude: 28.053572, longitude: 34.441985, 
	sport: 1, seasons: '')

Spot.create!(name: 'Marsa Alam - Blue Lagoon', latitude: 24.910606, longitude: 34.976907, 
	sport: 1, seasons: '')


School.delete_all
School.create!(spot_id: 1, sports: 1, name: 'Tornado Surf', latitude: 26.795834, longitude: 33.941896,
	link: 'http://www.tornadosurf.com', affiliation: 1)
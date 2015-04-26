Continent.create!([
  {name: "Africa"},
  {name: "Europe"},
  {name: "Asia"},
  {name: "North America"},
  {name: "South America"},
  {name: "Australia"}
])
Country.create!([
  {name: "Egypt", continent_id: 1, slug: "egypt"},
  {name: "Tanzania", continent_id: 1, slug: "tanzania"},
  {name: "Kenya", continent_id: 1, slug: "kenya"},
  {name: "Mauritius", continent_id: 1, slug: "mauritius"},
  {name: "Dominican Republic", continent_id: 4, slug: "dominican-republic"}
])
Photo.create!([
  {image: "1.jpg", imageable_id: 1, imageable_type: "Spot"},
  {image: "soma-bay-holiday-10.jpg", imageable_id: 1, imageable_type: "Spot"},
  {image: "10.jpg", imageable_id: 1, imageable_type: "Spot"},
  {image: "1280x.jpeg", imageable_id: 1, imageable_type: "Spot"},
  {image: "Kite_Junkies_Sharm_8.jpg", imageable_id: 1, imageable_type: "Spot"},
  {image: "kite-junkies-amazing.jpg", imageable_id: 1, imageable_type: "Spot"},
  {image: "panoramic-1a.jpg", imageable_id: 1, imageable_type: "Spot"},
  {image: "10.jpg", imageable_id: 2, imageable_type: "Spot"},
  {image: "1280_2.jpeg", imageable_id: 2, imageable_type: "Spot"},
  {image: "1280x.jpeg", imageable_id: 2, imageable_type: "Spot"},
  {image: "kite-junkies-amazing.jpg", imageable_id: 3, imageable_type: "Spot"},
  {image: "panoramic-1a.jpg", imageable_id: 3, imageable_type: "Spot"},
  {image: "Kite_Junkies_Sharm_8.jpg", imageable_id: 3, imageable_type: "Spot"},
  {image: "kite-junkies-amazing.jpg", imageable_id: 3, imageable_type: "Spot"},
  {image: "1280x.jpeg", imageable_id: 4, imageable_type: "Spot"},
  {image: "1.jpg", imageable_id: 4, imageable_type: "Spot"},
  {image: "IMG_2414.JPG", imageable_id: 5, imageable_type: "Spot"},
  {image: "IMG_2102.JPG", imageable_id: 5, imageable_type: "Spot"}
])
School.create!([
  {spot_id: 1, sports: nil, name: "Tornado Surf", latitude: "26.795834", longitude: "33.941896", link: "http://www.tornadosurf.com", affiliation: 1}
])
Season.create!([
  {spot_id: 1, sport_id: 3, months: "111111111111"},
  {spot_id: 1, sport_id: 2, months: "111111111111"}
])
Sport.create!([
  {name: "Surfing"},
  {name: "Windsurfing"},
  {name: "Kitesurfing"}
])
Spot.create!([
  {name: "Soma Bay", latitude: "26.844535", longitude: "33.956664", country_id: 1, slug: "soma-bay"},
  {name: "El Gouna", latitude: "27.396147", longitude: "33.687928", country_id: 1, slug: "el-gouna"},
  {name: "Sharm el Sheikh, Nabq", latitude: "28.053572", longitude: "34.441985", country_id: 1, slug: "sharm-el-sheikh-nabq"},
  {name: "Marsa Alam - Blue Lagoon", latitude: "24.910606", longitude: "34.976907", country_id: 1, slug: "marsa-alam-blue-lagoon"},
  {name: "Cabarete Beach", latitude: "19.753133", longitude: "-70.411463", country_id: 5, slug: "cabarete-beach"}
])
FriendlyId::Slug.create!([
  {slug: "soma-bay", sluggable_id: 1, sluggable_type: "Spot", scope: nil},
  {slug: "el-gouna", sluggable_id: 2, sluggable_type: "Spot", scope: nil},
  {slug: "sharm-el-sheikh-nabq", sluggable_id: 3, sluggable_type: "Spot", scope: nil},
  {slug: "marsa-alam-blue-lagoon", sluggable_id: 4, sluggable_type: "Spot", scope: nil},
  {slug: "cabarete-beach", sluggable_id: 5, sluggable_type: "Spot", scope: nil}
])

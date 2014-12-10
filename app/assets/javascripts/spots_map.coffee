initializeSpotsMap = () ->

  #myLatlng = new google.maps.LatLng( spot.latitude, spot.longitude)
  # spot.name ??
  myLatlng = new google.maps.LatLng( 10, 10 )
  mapOptions = {
    zoom: 4,
    center: myLatlng
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions)

  marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title: 'name'
  })

  console.log( myLatlng, 'init' )


google.maps.event.addDomListener(window, 'load', initializeSpotsMap)

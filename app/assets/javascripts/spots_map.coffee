if document.getElementById('map-canvas')

  # define for one spot or multiple
  if gon.mapspots.id
    mapspots = [
      gon.mapspots
    ]
    map = new google.maps.Map document.getElementById('map-canvas'), {
      zoom: 5,
      center: new google.maps.LatLng( gon.mapspots.latitude, gon.mapspots.longitude )
    }
  else
    mapspots = gon.mapspots
    map = new google.maps.Map document.getElementById('map-canvas'), {
      zoom: 3,
      center: new google.maps.LatLng( 0, 0 )
    }



  marker = []
  for item in mapspots
    marker[item.id] = {
      'name': item.name
      'LatLng': new google.maps.LatLng( item.latitude, item.longitude )
    }
    new google.maps.Marker({
        position: marker[item.id]['LatLng']
        map: map
        title: marker[item.id]['name']
    })

  console.log(marker)

  google.maps.event.addDomListener(window, 'load')

  

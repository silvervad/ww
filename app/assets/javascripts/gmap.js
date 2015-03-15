function gmap_init() {
  var 
  countryMapStyles = [
    {
      featureType: "all",
      elementType: "labels",
      stylers: [
        { visibility: "off" }
      ]
    },
    {
      featureType: "administrative.country",
      elementType: "labels",
      stylers: [
        { visibility: "on" }
      ]
    },
    {
      featureType: "road",
      elementType: "geometry",
      stylers: [
        { visibility: "off" }
      ]
    }
  ],
  
  spotMapStyles = [
    {
      featureType: "all",
      elementType: "labels",
      stylers: [
        { visibility: "on" }
      ]
    },
    {
      featureType: "road",
      elementType: "geometry",
      stylers: [
        { visibility: "on" }
      ]
    }
  ],
  
  countryMapOptions = {
    styles: countryMapStyles,
    mapTypeId: google.maps.MapTypeId.HYBRID
  },
  
  spotMapOptions = {
    zoom: 1,
    styles: spotMapStyles,
    mapTypeId: google.maps.MapTypeId.HYBRID
  },
  
  markers = gon.markers,
  
  iconNormal = {
        path: google.maps.SymbolPath.CIRCLE,
        scale: 6,
        strokeColor: '#003333',
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: '#00BBBB',
        fillOpacity: 1
  },
  
   iconHover = {
        path: google.maps.SymbolPath.CIRCLE,
        scale: 6,
        strokeColor: '#003333',
        strokeOpacity: 0.8,
        strokeWeight: 3,
        fillColor: '#00BBBB',
        fillOpacity: 1
  },
  mode = "none";
  
//Placing map in the div
  
  if (document.getElementById("country-map-canvas")) {
    map = new google.maps.Map(document.getElementById("country-map-canvas"),
    countryMapOptions);
    mode = "country";
  }

  if (document.getElementById("spot-map-canvas")) {
    map = new google.maps.Map(document.getElementById("spot-map-canvas"),
    spotMapOptions);
    mode = "spot";
  }


// Placing markers and infoWindow

  var 
    infowindow = new google.maps.InfoWindow(),
    marker, 
    i,
    myBounds = new google.maps.LatLngBounds();
  
  
  if (markers) {  
    for (i = 0; i < markers.length; i++) {  
      myLatLng = new google.maps.LatLng(markers[i][1], markers[i][2]);
      marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        icon: iconNormal,
        title: markers[i][0]
      });
      
      myBounds.extend(myLatLng);
     
      google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
        return function() {
          windowContent = "<span class=map-info-window>" + markers[i][0] + "</span>"
          infowindow.setContent(windowContent);
          infowindow.open(map, marker);
          marker.setIcon(iconHover);
        }
      })(marker, i));
      
      google.maps.event.addListener(marker, 'mouseout', (function(marker, i) {
        return function() {
          infowindow.close(map, marker);
          marker.setIcon(iconNormal);
        }
      })(marker, i));
      
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          window.location.href = markers[i][3]; 
        }
      })(marker, i));
    }
  }
  
// Setting bounds (center and zoom)

  if (i > 1) {
    map.fitBounds(myBounds);
  }
  else {
    if (mode == "country") {
      // change it so for 1 spot in spot view it shows good zoom
      var geocoder = new google.maps.Geocoder();
      geocoder.geocode( { 'address': gon.country}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          map.setCenter(results[0].geometry.location);
          map.fitBounds(results[0].geometry.viewport);
        }
      });
    }
    else if (mode == "spot") {
      map.setCenter(marker.getPosition());
      map.setZoom (15);
    }

  }

}

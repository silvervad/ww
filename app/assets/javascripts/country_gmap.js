function initialize() {
  var styles = [
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
  
  mapOptions = {
    center: new google.maps.LatLng(-34.397, 150.644),
    zoom: 8,
    styles: styles,
    mapTypeId: google.maps.MapTypeId.HYBRID
  },
  
  markers = gon.markers,
  
  icon1 = {
        path: google.maps.SymbolPath.CIRCLE,
        scale: 6,
        strokeColor: '#003333',
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: '#00BBBB',
        fillOpacity: 1
  },
  
   icon2 = {
        path: google.maps.SymbolPath.CIRCLE,
        scale: 6,
        strokeColor: '#003333',
        strokeOpacity: 0.8,
        strokeWeight: 3,
        fillColor: '#00BBBB',
        fillOpacity: 1
  },
  
  
  map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);


  var infowindow = new google.maps.InfoWindow();

  var marker, i,
  myBounds = new google.maps.LatLngBounds();
  

  if (markers) {  
    for (i = 0; i < markers.length; i++) {  
      myLatLng = new google.maps.LatLng(markers[i][1], markers[i][2]);
      marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        icon: icon1,
        title: markers[i][0]
      });
      
      myBounds.extend(myLatLng);
     
      
      google.maps.event.addListener(marker, 'mouseover', (function(marker, i) {
        return function() {
          windowContent = "<span class=map-info-window>" + markers[i][0] + "</span>"
          infowindow.setContent(windowContent);
          infowindow.open(map, marker);
          marker.setIcon(icon2);
        }
      })(marker, i));
      
      google.maps.event.addListener(marker, 'mouseout', (function(marker, i) {
        return function() {
          infowindow.close(map, marker);
          marker.setIcon(icon1);
        }
      })(marker, i));
      
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          window.location.href = markers[i][3]; 
        }
      })(marker, i));
  
    }
  }
  
  if (i > 1) {
    map.fitBounds(myBounds);
  }
  else {
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode( { 'address': gon.country}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        map.fitBounds(results[0].geometry.viewport);
      }
    });
  }

}

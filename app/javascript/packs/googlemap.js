function initMap() {
  // latitude,longitudeから位置を特定
      const test ={lat: <%= @event.latitude %>, lng: <%= @event.longitude %> };
      const map = new google.maps.Map(document.getElementById('map'), {
                zoom: 15, 
                center: test
                });
      const transitLayer = new google.maps.TransitLayer();
      transitLayer.setMap(map);

      const contentString = '住所：<%= @event.address %>';
      const infowindow = new google.maps.InfoWindow({
        content: contentString
      });

  //  Map上の指定した位置にピンを挿して表示する
      const marker = new google.maps.Marker({
                    position:test,
                    map: map,
                    title: contentString
                  });

      marker.addListener('click', function() {
        infowindow.open(map, marker);
      });
    }
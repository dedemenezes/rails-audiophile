// app/javascript/plugins/init_mapbox.js
import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lon, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 2500 });
};

const initMapbox = (markers) => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapElement.style = "height: 350px;"
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lon, marker.lat])
        .addTo(map);
    });

    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };

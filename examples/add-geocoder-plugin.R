geocoder_plugin <- htmltools::htmlDependency(
  name = "geocoder",
  version = "4.7.2",
  src = c(href = "https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2"),
  script = "mapbox-gl-geocoder.min.js",
  stylesheet = "mapbox-gl-geocoder.css"
)

mapboxer() %>%
  mapboxer:::add_deps(list(geocoder_plugin)) %>%
  htmlwidgets::onRender(
    "function(el, x) {
       console.log('x', mapboxer._widget[el.id]);
       const map = mapboxer._widget[el.id].map;
       const geocoder = new MapboxGeocoder({
         accessToken: mapboxgl.accessToken,
         mapboxgl: mapboxgl
       });
       map.addControl(geocoder);
     }"
  )

# data_url <- "https://docs.mapbox.com/mapbox-gl-js/assets/earthquakes.geojson"
# earthquakes <- sf::st_read(data_url)

quakes %>%
  as_mapbox_source(
    lat = "lat",
    lng = "long",
    cluster = TRUE,
    clusterMaxZoom = 14,
    clusterRadius = 50
  ) %>%
  mapboxer(center = c(176.9, -24.655), zoom = 4) %>%
  add_circle_layer(
    circle_color = "red",
    circle_radius = list(
      "step",
      list("get", "point_count"),
      10, 15,
      20, 30,
      30, 80,
      40
    ),
    filter = list("has", "point_count"),
    popup = "{{point_count}}"
  )

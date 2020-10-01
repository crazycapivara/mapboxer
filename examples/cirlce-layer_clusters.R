data_url <- "https://docs.mapbox.com/mapbox-gl-js/assets/earthquakes.geojson"
earthquakes <- sf::st_read(data_url)

earthquakes %>%
  as_mapbox_source(
    cluster = TRUE,
    clusterMaxZoom = 14,
    clusterRadius = 50
  ) %>%
  mapboxer(
    center = c(-103.59179687498357, 40.66995747013945),
    zoom = 3
  ) %>%
  add_navigation_control() %>%
  add_circle_layer(
    circle_color = list(
      'step', c("get", "point_count"),
      "#51bbd6", 100,
      "#f1f075", 750,
      "#f28cb1"
    ),
    circle_radius = list(
      "step", c("get", "point_count"),
      20, 100,
      30, 750,
      40
    ),
    filter = c("has", "point_count"),
    popup = "{{point_count_abbreviated}}"
  ) #%>% add_layer()

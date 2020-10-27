library(mapboxer)

mvc <- sf::st_as_sf(motor_vehicle_collisions_nyc, coords = c("lng", "lat"))

as_mapbox_source(
  mvc,
  cluster = TRUE,
  clusterMaxZoom = 11,
  clusterRadius = 50
) %>%
  mapboxer(
    bounds = sf::st_bbox(mvc),
    element_id = "crashes",
    minZoom = 9
  ) %>%
  add_navigation_control() %>%
  add_circle_layer(
    id = "clustered",
    circle_color = "blue",
    circle_radius = list(
      "step",
      list("get", "point_count"),
      10, 40,
      15, 60,
      20, 80,
      25, 100,
      30
    ),
    popup = "Number of crashes: {{point_count}}",
    filter = list("has", "point_count")
  ) %>%
  add_circle_layer(
    id = "unclustered",
    filter = list("!", list("has", "point_count")),
    circle_color = "red",
    circle_radius = 5,
    popup = "{{date}} {{time}}"
  )

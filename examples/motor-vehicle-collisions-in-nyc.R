library(mapboxer)

LAYER_ID <- "crashes"

as_mapbox_source(motor_vehicle_collisions_nyc) %>%
  mapboxer(
    center = c(-73.9165, 40.7114),
    zoom = 10
  ) %>%
  add_circle_layer(
    id = LAYER_ID,
    circle_color = list(
      "match",
      list("get", "injured"),
      0, "yellow",
      1, "orange",
      "red"
    ),
    circle_radius = list("+", list("get", "injured"), 2),
    popup = "<p>{{date}} {{time}}</p><p>Number of injured persons: {{injured}}</p>"
  ) %>%
  add_filter_control(
    LAYER_ID,
    filter = list(">=", "injured", 0),
    pos = "top-left"
  )

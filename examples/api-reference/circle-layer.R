map <- as_mapbox_source(motor_vehicle_collisions_nyc) %>%
  mapboxer() %>%
  set_view_state(-73.9165, 40.7114, 11) %>%
  add_circle_layer(
    circle_color = "red",
    circle_radius = 5,
    popup = "{{date}} {{time}}"
  )

if (interactive()) map

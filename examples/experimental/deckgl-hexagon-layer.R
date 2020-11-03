# deck.gl HexagonLayer

mapboxer(
  center = c(-73.9165, 40.7114),
  zoom = 10,
  pitch = 35
) %>%
  add_deckgl_layer(
    type = "HexagonLayer",
    data = motor_vehicle_collisions_nyc,
    extruded = TRUE,
    radius = 300,
    elevationScale = 4,
    getPosition = "@=[{{lng}}, {{lat}}]",
    opacity = 0.5,
    popup = "Number of crashes: {{points.length}}"
  ) %>%
  add_navigation_control()

mapboxer(
  style = basemaps$Carto$positron,
  center = c(-73.9165, 40.7114),
  zoom = 10
) %>%
  add_deckgl_layer(
    type = "ScatterplotLayer",
    id = "deckgl-layer",
    data = motor_vehicle_collisions_nyc,
    getPosition = htmlwidgets::JS("d => [d.lng, d.lat]"),
    radiusMinPixels = 3,
    radiusScale = 10,
    getFillColor = c(255, 140, 0),
    pickable = TRUE,
    onHover = htmlwidgets::JS("d => console.log(d)")
  ) %>%
  add_navigation_control()

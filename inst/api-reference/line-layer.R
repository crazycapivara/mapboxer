map <- geojsonsf::geo_melbourne %>%
  as_mapbox_source() %>%
  mapboxer(center = c(144.9624, -37.8105), zoom = 11, pitch = 45) %>%
  add_navigation_control() %>%
  add_line_layer(
    line_color = "red",
    line_width = 2
  )

if (interactive()) map

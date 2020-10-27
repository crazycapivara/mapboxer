map <-  as_mapbox_source(geojsonsf::geo_melbourne) %>%
  mapboxer(
    center = c(144.9624, -37.8105),
    zoom = 11,
    pitch = 45
  ) %>%
  add_navigation_control() %>%
  add_line_layer(
    line_color = c("get", "strokeColor"),
    line_width = 2,
    popup = "{{SA2_NAME}}"
  )

if (interactive()) map

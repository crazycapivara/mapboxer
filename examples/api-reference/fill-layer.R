 map <- as_mapbox_source(geojsonsf::geo_melbourne) %>%
  mapboxer() %>%
  set_view_state(
    lng =  144.9624,
    lat = -37.8105,
    zoom = 10,
    pitch = 35
  ) %>%
  add_fill_layer(
    fill_color = c("get", "fillColor"),
    fill_opacity = 0.6,
    popup = "Area: {{AREASQKM}} km<sup>2</sup>",
    # AREASQKM > 5
    filter = list(">", c("get", "AREASQKM"), 5)
  )

if (interactive()) map

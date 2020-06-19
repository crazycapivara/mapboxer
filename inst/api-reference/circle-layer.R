circle_style <- list(
  id = "circles",
  type = "circle",
  source = "bart-stations",
  paint = list(
    "circle-radius" = 5,
    "circle-color" = "blue"
  )
)

data <- geojsonsf::df_geojson(deckgl::bart_stations, lon = "lng", lat = "lat")

mapboxer() %>%
  set_view_state(lng = -122.45, lat = 37.8) %>%
  add_source(data, "bart-stations") %>%
  add_layer(circle_style)

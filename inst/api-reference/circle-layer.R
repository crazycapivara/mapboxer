circle_style <- list(
  id = "circles",
  type = "circle",
  source = "bart-stations",
  paint = list(
    "circle-radius" = 5,
    "circle-color" = "blue"
  )
)

source <- deckgl::bart_stations %>%
  as_mapbox_source(lng = "lng", lat = "lat")
class(source$data)

mapboxer() %>%
  set_view_state(lng = -122.45, lat = 37.8) %>%
  add_source(source, "bart-stations") %>%
  add_layer(circle_style)

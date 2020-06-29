lng <- -0.09
lat <- 51.5

map <- mapboxer() %>%
  set_view_state(lng, lat) %>%
  add_marker(lng, lat, popup = "You are here!")

if (interactive()) map

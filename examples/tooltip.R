url_us_states <- "https://docs.mapbox.com/mapbox-gl-js/assets/us_states.geojson"

#us_states <- sf::st_read(url_us_states)

mapboxer(center = c(-100.486052, 37.830348), zoom = 2) %>%
  add_fill_layer(
    id = "us",
    source = mapbox_source("geojson", data = url_us_states),
    fill_color = "blue",
    fill_opacity = 0.4
  ) %>%
  add_tooltips("us", "{{STATE_NAME}}") %>%
  add_navigation_control()

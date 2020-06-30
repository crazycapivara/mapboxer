data_url <- paste0(
  "https://raw.githubusercontent.com/uber-common/deck.gl-data/",
  "master/examples/geojson/vancouver-blocks.json"
)
blocks <- sf::st_read(data_url)
names(blocks)

blocks %>%
  dplyr::mutate(
    color = scales::col_quantile("Blues", growth)(growth)
  ) %>%
  as_mapbox_source() %>%
  mapboxer() %>%
  set_view_state(
    lng = -123.13, lat = 49.254,
    zoom = 11, pitch = 40) %>%
  add_navigation_control() %>%
  add_fill_layer(
    fill_color = c("get", "color"),
    fill_opacity = 0.5,
    fill_outline_color = "white",
    popup = "Growth: {{growth}}"
  )

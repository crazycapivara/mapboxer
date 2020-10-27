data_url <- paste0(
  "https://raw.githubusercontent.com/uber-common/deck.gl-data/",
  "master/examples/geojson/vancouver-blocks.json"
)
blocks_sf <- sf::st_read(data_url)
pal <- scales::col_quantile("Blues", blocks_sf$growth)
bbox <- unname(sf::st_bbox(blocks_sf))

map <- blocks_sf %>%
  dplyr::mutate(color = pal(growth)) %>%
  as_mapbox_source() %>%
  mapboxer(bounds = bbox, pitch = 40) %>%
  add_navigation_control() %>%
  add_fill_layer(
    fill_color = c("get", "color"),
    fill_opacity = 0.5,
    fill_outline_color = "white",
    popup = "Growth: {{growth}}"
  )

if (interactive()) map

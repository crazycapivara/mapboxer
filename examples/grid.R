library(mapboxer)

sf::sf_use_s2(TRUE)

mvc_sf <- sf::st_as_sf(
  motor_vehicle_collisions_nyc,
  coords = c("lng", "lat"),
  crs = 4326
)

grid_sf <- sf::st_make_grid(mvc_sf)[mvc_sf] %>%
  sf::st_sf()

grid_sf <- dplyr::mutate(
  grid_sf,
  count = lengths(sf::st_intersects(grid_sf, mvc_sf)),
  color = scales::col_quantile("Blues", count)(count)
)

plot(sf::st_geometry(mvc_sf))
plot(sf::st_geometry(grid_sf), add = TRUE, col = grid_sf$color)

as_mapbox_source(grid_sf) %>%
  mapboxer(
    bounds = sf::st_bbox(grid_sf),
    fitBoundsOptions = list(padding = 20)
  ) %>%
  add_navigation_control() %>%
  add_circle_layer(
    source = as_mapbox_source(mvc_sf),
    circle_color = "orange",
    visibility = FALSE
  ) %>%
  add_fill_layer(
    fill_color = c("get", "color"),
    fill_opacity = 0.4,
    fill_antialias = FALSE,
    popup = "Number of crashes: {{count}}"
  )

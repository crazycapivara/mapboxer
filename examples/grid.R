mvc_sf <- sf::st_as_sf(
  motor_vehicle_collisions_nyc,
  coords = c("lng", "lat"),
  crs = 4326
)

grid_sf <- sf::st_make_grid(mvc_sf)[mvc_sf] %>%
  sf::st_sf()

plot(sf::st_geometry(mvc_sf))
plot(grid_sf, add = TRUE)

grid_sf <- grid_sf %>%
  dplyr::mutate(
    count = lengths(sf::st_intersects(grid_sf, mvc_sf)),
    color = scales::col_quantile("Blues", count)(count)
)

as_mapbox_source(grid_sf) %>%
  mapboxer(bounds = unname(sf::st_bbox(grid_sf))) %>%
  add_navigation_control() %>%
  add_circle_layer(
    source = as_mapbox_source(mvc_sf),
    circle_color = "orange"
  ) %>%
  add_fill_layer(
    fill_color = c("get", "color"),
    fill_opacity = 0.4,
    popup = "{{count}}"
  )

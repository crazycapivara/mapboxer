as_mapboxer_viz <- function(data, style = basemaps$Carto$voyager, ...) {
  as_mapbox_source(data) %>%
    mapboxer(
      style = style,
      bounds = sf::st_bbox(data),
      element_id = "mapboxerviz"
    ) %>%
    add_navigation_control() %>%
    add_circle_layer(...)
}

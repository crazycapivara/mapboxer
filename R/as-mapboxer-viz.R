as_mapboxer_viz <- function(data, style = basemaps$Carto$voyager, ...,
                            layer_id = "mapboxer-viz", coords = NULL) {
  # Use classes imstead
  if (!is.null(coords)) data <- sf::st_as_sf(data, coords = coords)

  as_mapbox_source(data) %>%
    mapboxer(
      style = style,
      bounds = sf::st_bbox(data),
      element_id = "mapboxerviz"
    ) %>%
    add_navigation_control() %>%
    add_circle_layer(..., id = layer_id)
}

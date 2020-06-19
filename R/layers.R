#' Add a layer to the map
#'
#' @param map ...
#' @param style The definition of the layer.
#' @export
add_layer <- function(map, style) {
  map %>%
    invoke_method("addLayer", style = style)
}

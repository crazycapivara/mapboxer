#' Add a layer to the map
#'
#' Adds any kind of layer to the map.
#' The type of the layer is specified by the \code{type} property of the
#' layer definintion.
#' @param map A \link{mapboxer} object.
#' @param style A named list that defines the style of the layer.
#'   See \url{https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/} for available style options
#'   for the used layer type.
#' @inheritParams add_popups
#' @seealso \link{add_popups} for an example of a mustache template used to generate the popup text.
#' @example examples/api-reference/generic-layer.R
#' @export
add_layer <- function(map, style, popup = NULL) {
  map %<>%
    invoke_method("addLayer", style = style)
  if (is.null(popup)) return(map)

  map %>%
    add_popups(style$id, popup)
}

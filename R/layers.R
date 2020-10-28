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

#' Add popups to a layer
#'
#' Usually you will add the popups in the \link{add_layer} function by setting the \code{popup}
#'   parameter.
#' @param map A \link{mapboxer} object.
#' @param layer_id The ID of the layer to which you want to add the popups.
#' @param popup A \href{https://github.com/janl/mustache.js}{mustache} template
#'   in which the tags refer to the properties of the layer's data object.
#' @example examples/api-reference/popups.R
#' @export
add_popups <- function(map, layer_id, popup) {
  invoke_method(map, "addPopups", layerId = layer_id, popup = popup)
}

#' Add tooltips to a layer
#'
#' @param map A \link{mapboxer} object.
#' @param layer_id The ID of the layer to which you want to add the tooltips.
#' @param tooltip A \href{https://github.com/janl/mustache.js}{mustache} template
#'   in which the tags refer to the properties of the layer's data object.
#' @export
add_tooltips <- function(map, layer_id, tooltip) {
  invoke_method(map, "addTooltips", layerId = layer_id, tooltip = tooltip)
}

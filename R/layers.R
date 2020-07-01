#' Add a layer to the map
#'
#' Adds any kind of layer to the map.
#' The type of the layer is specified by the \code{type} property of the
#' layer definintion.
#' @inheritParams set_view_state
#' @inheritParams add_popups
#' @param style A named list that defines the style of the layer.
#'   See \url{https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/} for available style options
#'   for the used layer type.
#' @seealso \link{add_popups} for an example of a mustache template used to generate the popup text.
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
#' @inheritParams set_view_state
#' @param layer_id The ID of the layer to which you want to add the popups.
#' @param popup A \href{https://github.com/janl/mustache.js}{mustache} template
#'   in which the tags refer to the properties of the layer's data object.
#' @example examples/popups.R
#' @export
add_popups <- function(map, layer_id, popup) {
  map %>%
    invoke_method("addPopups", layer = layer_id, popup = popup)
}

#' Add a layer to the map
#'
#' Adds any kind of layer to the map.
#' The type of the layer is specified by the \code{type} property of the
#' layer definintion.
#' @inheritParams set_view_state
#' @param style A named list that contains the definition of the layer.
#'   See \url{https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/}.
#' @param popup A \code{mustache} template string.
#' @export
add_layer <- function(map, style, popup = NULL) {
  map %<>%
    invoke_method("addLayer", style = style)
  if (is.null(popup)) return(map)

  map %>%
    add_popup(style$id, popup)
}

#' Add popups for a given layer to the map
#'
#' @inheritParams add_layer
#' @param layer The name of the layer.
#' @export
add_popup <- function(map, layer, popup) {
  map %>%
    invoke_method("addPopup", layer = layer, popup = popup)
}

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
#' @param popup a \link{mapbox_popup} object or a template string.
#' @example examples/api-reference/popups.R
#' @export
add_popups <- function(map, layer_id, popup) {
  if (is.character(popup)) {
    popup <- mapbox_popup(
      template = popup
    )
  }

  invoke_method(map, ifelse(popup$event == "click", "addPopups", "addTooltips"),
                layerId = layer_id, template = popup$template, options = popup$options)
}

#' Create a popup object
#' @param template A \href{https://github.com/janl/mustache.js}{mustache} template
#'   in which the tags refer to the properties of the layer's data object.
#' @param ... The options of the popup element, see see https://docs.mapbox.com/mapbox-gl-js/api/markers/#popup
#' @param event The event on which the popup is displayed.
#' @export
mapbox_popup <- function(template, ..., event = c("click", "hover")) {
  structure(
    list(
      template = template,
      options = list(...),
      event = match.arg(event)
    ),
    class = "mapbox_popup"
  )
}

#' Add tooltips to a layer (deprecated)
#' @param map A \link{mapboxer} object.
#' @param ... ignored
#' @export
add_tooltips <- function(map, ...) {
  warning("Nothing added.\n",
          "'add_tooltips' is deprecated.\n",
          "Use 'add_popups' instead and pass event = 'hover' to 'mapbox_popup'.")
  map
}

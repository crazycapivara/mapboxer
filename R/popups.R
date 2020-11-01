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
#' @param event The event on which the popup is displayed. Use 'hover' if you want to create a tooltip.
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

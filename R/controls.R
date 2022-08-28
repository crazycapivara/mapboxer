#' Add a standard control to the map
#' @inheritParams set_view_state
#' @param control_name The (class) name of the control.
#' @param ... The options of the control.
#' @param pos The position of the control. One of \code{top-left}, \code{top-right},
#'   \code{bottom-right} or \code{bottom-left}.
#' @param mapboxgl_contrl If TRUE (the default) the constuctor is "mapboxgl.control_name" otherwise just "control_name"
#' @seealso \url{https://docs.mapbox.com/mapbox-gl-js/api/markers/} for available options for the used control.
#' @example examples/api-reference/standard-controls.R
#' @export
add_control <- function(map, control_name, ..., pos = NULL, mapboxgl_contrl = TRUE) {
  final_control_name <- ifelse(mapboxgl_contrl, paste("mapboxgl", control_name, sep = "."), control_name)
  map %>%
    invoke_method("addControl", controlName = final_control_name, pos = pos, options = list(...))
}

#' @export
#' @name add_control
add_navigation_control <- function(map, ..., pos = NULL) {
  map %>%
    add_control("NavigationControl", ..., pos = pos)
}

#' @export
#' @name add_control
add_scale_control <- function(map, ..., pos = NULL) {
  map %>%
    add_control("ScaleControl", ..., pos = pos)
}

#' @export
#' @name add_control
add_fullscreen_control <- function(map, pos = NULL) {
  map %>%
    add_control("FullscreenControl", pos = pos)
}

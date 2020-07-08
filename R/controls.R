#' Add a standard control to the map
#' @inheritParams set_view_state
#' @param control_name The (class) name of the control.
#' @param ... The options of the control.
#' @param pos The position of the control. One of \code{top-left}, \code{top-right},
#'   \code{bottom-right} or \code{bottom-left}.
#' @seealso \url{https://docs.mapbox.com/mapbox-gl-js/api/markers/} for available options for the used control.
#' @example examples/standard-controls.R
#' @export
add_control <- function(map, control_name, ..., pos = NULL) {
  map %>%
    invoke_method("addControl", controlName = control_name, pos = pos, options = list(...))
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

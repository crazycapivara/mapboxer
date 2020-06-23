add_control <- function(map, control_name, ..., pos = NULL) {
  map %>%
    invoke_method("addControl", controlName = control_name, pos = pos, options = list(...))
}

#' Add a navigation control to the map
#'
#' @inheritParams set_view_state
#' @param ... The properties of the control.
#' @param pos The position of the control, one of \code{top-left}, \code{top-right},
#'   \code{bottom-right} or \code{bottom-left}.
#' @export
add_navigation_control <- function(map, ..., pos = NULL) {
  map %>%
    add_control("NavigationControl", ..., pos = pos)
}

#' Add a scale control to the map
#'
#' @inheritParams add_navigation_control
#' @export
add_scale_control <- function(map, ..., pos = NULL) {
  map %>%
    add_control("ScaleControl", ..., pos = pos)
}

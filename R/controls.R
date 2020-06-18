add_control <- function(map, control_name, ..., pos = NULL) {
  invoke_method(map, "addControl", controlName = control_name, pos = pos, options = list(...))
}

#' @export
add_navigation_control <- function(map, ..., pos = NULL) {
  # invoke_method(map, "addNavigationControl", pos = pos, options = list(...))
  add_control(map, "NavigationControl", ..., pos = pos)
}

#' @export
add_scale_control <- function(map, ..., pos = NULL) {
  add_control(map, "ScaleControl", ..., pos = pos)
}

#' @export
add_navigation_control <- function(map, ..., pos = "top-right") {
  invoke_method(map, "addNavigationControl", pos = pos, options = list(...))
}

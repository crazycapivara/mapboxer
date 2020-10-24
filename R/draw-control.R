#' Add a draw control to the map
#' @inheritParams add_control
#' @param data (experimental) A \code{GeoJSON} or \link[sf] object.
#' @seealso \url{https://github.com/mapbox/mapbox-gl-draw/blob/main/docs/API.md}
#'   for available options for the draw control.
#' @export
add_draw_control <- function(map, ..., pos = NULL, data = NULL) {
  if (inherits(data, "sf")) {
    data <- geojsonsf::sf_geojson(data)
  }

  map$dependencies <- c(map$dependencies, use_deps("mapbox-gl-draw"))
  invoke_method(map, "addDrawControl", pos = pos, options = list(...), data = data)
}

#' Add a draw control to the map (experimental)
#' @inheritParams add_control
#' @param data A \code{GeoJSON} or \code{sf} object.
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

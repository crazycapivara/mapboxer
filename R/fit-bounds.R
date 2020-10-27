#' Fit the map to a bounding box
#' @param map A \link{mapboxer} object.
#' @param bounds The bounding box as a vector in [west, south, east, north] order.
#' @param ... Optional arguments, see \url{https://docs.mapbox.com/mapbox-gl-js/api/map/#map#fitbounds}.
#' @export
fit_bounds <- function(map, bounds, ...) {
  invoke_method(map, "fitBounds", bounds = bounds, options = list(...))
}

#' Fly to a specific location
#' @param map A \link{mapboxer} object.
#' @param center The location coordinates as a vector in [lat, lng] order
#' @param ... Optional arguments, see \url{https://docs.mapbox.com/mapbox-gl-js/api/map/#map#flyto}.
#' @export
fly_to <- function(map, center, ...) {
  invoke_method(map, "flyTo", options = list(center = center, ...))
}

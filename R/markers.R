#' At a single marker to the map
#' @param lng The longitude of the marker.
#' @param lat The latitude of the marker.
#' @param popup The popup text (HTML) that is displayed when you click on the marker.
#' @export
add_marker <- function(map, lat, lng, popup = NULL) {
  map %>%
    invoke_method("addMarker", lng = lng, lat = lat, popup = popup)
}

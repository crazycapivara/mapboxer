#' Add a single marker to the map
#' @inheritParams set_view_state
#' @param lng The longitude of the marker.
#' @param lat The latitude of the marker.
#' @param popup The popup text (HTML) that is displayed when you click on the marker.
#' @example examples/marker.R
#' @export
add_marker <- function(map, lng, lat, popup = NULL) {
  map %>%
    invoke_method("addMarker", lng = lng, lat = lat, popup = popup)
}

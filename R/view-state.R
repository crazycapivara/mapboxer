#' Set the view state of the map
#'
#' @param map A \link{mapboxer} object.
#' @param lng The longitude of the  geographical center point of the map.
#' @param lat The latitude of the geographical center point of the map.
#' @param zoom The zoom level of the map.
#' @param pitch The pitch (tilt) of the map.
#' @param bearing The bearing (rotation) of the map.
#' @export
set_view_state <- function(map, lng, lat, zoom = 9, pitch = 0, bearing = 0) {
  map$x$mapProps %<>% utils::modifyList(
    list(
      center = c(lng, lat),
      zoom = zoom,
      pitch = pitch,
      bearing = bearing
    )
  )

  map
}

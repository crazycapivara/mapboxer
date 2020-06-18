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

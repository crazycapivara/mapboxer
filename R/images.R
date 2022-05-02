add_image <- function(map, url, id = "mapboxer", ...) {
  invoke_method(map, "addImage", url = url, id = id, ...)
}

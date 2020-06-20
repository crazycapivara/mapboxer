#' Add a data source to the map
#'
#' @param map The map widget.
#' @param data The data ...
#' @param id The unique id of the data source.
#' @param ... Optional parameters, see ...
#' @export
add_source <- function(map, data, id, ...) {
  UseMethod("add_source", data)
}

#' @rdname add_source
#' @export
add_source.default <- function(map, data, id, ...) {
  map %>%
    invoke_method("addSource", id = id, source = list(data = data, ...))
}

#' @rdname add_source
#' @export
add_source.json <- function(map, data, id, ...) {
  source <- list(
    data = data,
    type = "geojson"
  )
  map %>%
    invoke_method("addSource", id = id, source = source)
}

#' @rdname add_source
#' @export
add_source.sf <- function(map, data, id, ...) {
  map %>%
    add_source.json(geojsonsf::sf_geojson(data), id, ...)
}

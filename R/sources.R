#' Add a data source to the map
#'
#' @param map A map widget.
#' @param source A source created by \link{create_source}.
#' @param id The unique id of the data source.
#' @export
add_source <- function(map, source, id = "mapboxer") {
  map %>%
    invoke_method(
      "addSource",
      id = id,
      source = source
    )
}

#' Create a Mapbox data source
#'
#' @param ... see \href{https://docs.mapbox.com/mapbox-gl-js/style-spec/sources}
#' @export
create_source <- function(...) {
  UseMethod("create_source")
}

#' @rdname create_source
#' @export
create_source.default <- function(...) {
  list(...)
}

#' @rdname create_source
#' @export
create_source.json <- function(data, ...) {
  list(
    type = "geojson",
    data = data
  )
}

#' @param data A data frame containing data that can be converted to \code{geojson}.
#' @param lng The longitude ...
#' @param lat The Latitude ...
#' @rdname create_source
#' @export
create_source.data.table <- function(data, ..., lng = "lng", lat = "lat") {
  geojsonsf::df_geojson(data, lng, lat) %>%
    create_source.json(...)
}

#' @rdname create_source
#' @export
create_source.sf <- function(data, ...) {
  geojsonsf::sf_geojson(data) %>%
    create_source.json(...)
}

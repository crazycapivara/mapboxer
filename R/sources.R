#' Add a data source to the map
#'
#' @param map A map widget.
#' @param source A Mapbox source.
#' @param id The unique id of the data source.
#' @export
add_source <- function(map, source, id = "mapboxer") {
  map %>%
    invoke_method("addSource", id = id, source = source)
}

#' Create a Mapbox data source
#'
#' @param type The type of the source, e. g. \code{geojson}.
#' @param ... The properties of the source.
#'   See \href{https://docs.mapbox.com/mapbox-gl-js/style-spec/sources} for available props
#'   for the given type.
#' @export
mapbox_source <- function(type, ...) {
  structure(list(type = type, ...), class = "mapbox_source")
}

#' @export
as_mapbox_source <- function(data, ...) {
  UseMethod("as_mapbox_source")
}

mapbox_geojson_source <- function(data, ...) {
  mapbox_source(type = "geojson", data = data, ...)
}

#' @export
#' @name as_mapbox_source
as_mapbox_source.json <- mapbox_geojson_source

#' @export
#' @name as_mapbox_source
as_mapbox_source.data.frame <- function(data, lng = "lng", lat = "lat", ...) {
  geojsonsf::df_geojson(data, lng, lat) %>%
    mapbox_geojson_source(...)
}

#' @export
#' @name as_mapbox_source
as_mapbox_source.sf <- function(data, ...) {
  geojsonsf::sf_geojson(data) %>%
    mapbox_geojson_source(...)
}

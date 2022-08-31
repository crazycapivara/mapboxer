#' Add a Mapbox source to the map
#' @inheritParams set_view_state
#' @param source A Mapbox source.
#' @param id The unique id of the data source.
#' @export
add_source <- function(map, source, id = "mapboxer") {
  invoke_method(map, "addSource", id = id, source = source)
}

#' Create a Mapbox source
#' @param type The type of the source, e. g. \code{geojson}.
#' @param ... The properties of the source.
#'   See \url{https://docs.mapbox.com/mapbox-gl-js/style-spec/sources} for available options
#'   for the given source type.
#' @export
mapbox_source <- function(type, ...) {
  structure(list(type = type, ...), class = "mapbox_source")
}

#' Convert a data object to a Mapbox GeoJSON source
#' @param data A data frame that contains longitudes and latitudes in separate columns
#'   or an \code{sf}-object.
#' @inheritParams mapbox_source
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

#' @param lng The name of the column containing the longitudes.
#' @param lat The name of the column containing the latitudes.
#' @export
#' @name as_mapbox_source
as_mapbox_source.data.frame <- function(data, lng = "lng", lat = "lat", ...) {
  geojsonsf::df_geojson(data, lng, lat, simplify = FALSE) %>%
    mapbox_geojson_source(...)
}

#' @export
#' @name as_mapbox_source
as_mapbox_source.sf <- function(data, ...) {
  geojsonsf::sf_geojson(data, simplify = FALSE) %>%
    mapbox_geojson_source(...)
}

#' Update the tiles URL of a vector source
#' @param source_id The id of the data source to update
#' @param tiles A new list of tile urls
#' @export
set_source_tiles <- function(map, source_id, tiles) {
  invoke_method(map, "setSourceTiles", sourceId = source_id, tiles = tiles)
}

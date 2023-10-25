#' Set the fog properties for a map
#' @param map A \link{mapboxer} object.
#' @param ... Optional arguments, see \url{https://docs.mapbox.com/mapbox-gl-js/api/map/#map#setfog}.
#' @export
set_fog <- function(map, ...) {
    invoke_method(map, "setFog", options = list(...))
}

#' Set the terrain properties for a map
#' @param map A \link{mapboxer} object.
#' @param terrain_source A Mapbox source of type 'raster-dem'
#' @param exaggeration The exaggeration factor
#' @param ... Optional arguments, see \url{https://docs.mapbox.com/mapbox-gl-js/example/add-terrain/}.
#' @export
set_terrain <- function(map, terrain_source, exaggeration = 1.5, ...) {
  invoke_method(map, "setTerrain", source = terrain_source,
                exaggeration = exaggeration, options = list(...))
}


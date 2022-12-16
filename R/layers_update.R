#' Update layer properties
#' @inheritParams set_view_state
#' @param layer_id The ID of the layer whose property should be updated.
#' @param property The name of the property that should be updated.
#' @param value The new value of the property.
#' @name set_layer_properties
NULL

#' @describeIn set_layer_properties Update a paint property of a layer.
#' @export
set_paint_property <- function(map, layer_id, property, value) {
  map %>%
    invoke_method("setPaintProperty", layer = layer_id, property = gsub("_", "-", property), value = value)
}

#' @describeIn set_layer_properties Update a layout property of a layer.
#' @export
set_layout_property <- function(map, layer_id, property, value) {
  if (property == "visibility" & is.logical(value)) {
    value = ifelse(value, "visible", "none")
  }

  map %>%
    invoke_method("setLayoutProperty", layer = layer_id, property = gsub("_", "-", property), value = value)
}

#' Update the data of a Mapbox source
#' @param map A \link{mapboxer_proxy} object.
#' @param data A \code{GeoJSON} object, an url pointing to an external \code{GeoJSON} document,
#'   a data frame that contains longitudes and latitudes in separate columns or an sf-object.
#' @param source_id The ID of the source whose data should be updated.
#' @param ... unused
#' @seealso
#' \itemize{
#'   \item \link[geojsonsf]{df_geojson}
#'   \item \link[geojsonsf]{sf_geojson}
#' }
#' @export
set_data <- function(map, data, source_id = NULL, ...) {
  UseMethod("set_data", data)
}

set_data_ <- function(map, data, source_id = NULL, ...) {
  invoke_method(map, "setData", source = source_id, data = data)
}

#' @export
#' @name set_data
set_data.character <- set_data_

#' @export
#' @name set_data
set_data.json <- set_data_

#' @inheritParams as_mapbox_source
#' @export
#' @name set_data
set_data.data.frame <- function(map, data, source_id = NULL, lng = "lng", lat = "lat", ...) {
  map %>%
    set_data_(geojsonsf::df_geojson(data, lng, lat, simplify = FALSE), source_id)
}

#' @export
#' @name set_data
set_data.sf <- function(map, data, source_id, ...) {
  map %>%
    set_data_(geojsonsf::sf_geojson(data, simplify = FALSE), source_id)
}


#' Set feature state
#' See https://docs.mapbox.com/mapbox-gl-js/api/map/#map#setfeaturestate
#' @param source A Mapbox source.
#' @param feature_id The id of the feature to set the state for (one at a time)
#' @param feature_source The source
#' @param feature_source_layer The source layer (required for vector layers)
#' @export
set_feature_state <- function(map, feature_id, feature_source, feature_source_layer = NULL, state) {
  invoke_method(map, "setFeatureState", feature = list(id = feature_id, source = feature_source, sourceLayer = feature_source_layer), state = state)
}

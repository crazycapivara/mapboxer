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
    invoke_method("setPaintProperty", layer = layer_id, property = sub("_", "-", property), value = value)
}

#' @describeIn set_layer_properties Update a layout property of a layer.
#' @export
set_layout_property <- function(map, layer_id, property, value) {
  if (property == "visibility" & is.logical(value)) {
    value = ifelse(value, "visible", "none")
  }

  map %>%
    invoke_method("setLayoutProperty", layer = layer_id, property = property, value = value)
}

#' Update the data of a Mapbox source
#' @inheritParams set_view_state
#' @param data A \code{GeoJSON} object, an url pointing to an external \code{GeoJSON} document
#'   or a \link{mapbox_source} of type \code{GeoJSON}.
#' @param source_id The ID of the source whose data should be updated.
#' @seealso
#' \itemize{
#'   \item \link{as_mapbox_source}
#'   \item \link[geojsonsf]{df_geojson}
#'   \item \link[geojsonsf]{sf_geojson}
#' }
#' @export
set_data <- function(map, data, source_id = NULL) {
  UseMethod("set_data", data)
}

set_data_ <- function(map, data, source_id = NULL) {
  map %>%
    invoke_method("setData", source = source_id, data = data)
}

#' @export
#' @name set_data
set_data.character <- set_data_

#' @export
#' @name set_data
set_data.json <- set_data_

#' @export
#' @name set_data
set_data.mapbox_source <- function(map, data, source_id = NULL) {
  set_data_(map, data$data, source_id)
}

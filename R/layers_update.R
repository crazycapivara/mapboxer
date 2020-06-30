#' Update layer properties
#' @inheritParams set_view_state
#' @param layer_id The ID of the layer whose property should be updated.
#' @param property The name of the property that should be updated.
#' @param value The new value of the property.
#' @name update_layer_properties
NULL

#' @describeIn update_layer_properties Update a paint property of a layer.
#' @export
set_paint_property <- function(map, layer_id, property, value) {
  map %>%
    invoke_method("setPaintProperty", layer = layer_id, property = sub("_", "-", property), value = value)
}

#' @describeIn update_layer_properties Update a layout property of a layer.
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
#' @inheritParams as_mapbox_source
#' @param source_id The ID of the source whose data should be updated.
#' @export
set_data <- function(map, data, source_id = NULL) {
  map %>%
    invoke_method("setData", source = source_id, data = data)
}

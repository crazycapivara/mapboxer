#' Set the filter of a layer
#' @inheritParams set_paint_property
#' @inheritParams add_circle_layer
#' @export
set_filter <- function(map, layer_id, filter) {
  invoke_method(map, "setFilter", layerId = layer_id, filter = filter)
}

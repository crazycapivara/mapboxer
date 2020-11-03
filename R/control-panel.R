add_control_panel <- function(map, ...) {
  invoke_method(map, "addCustomControl", controlName = "XYZControl",
                options = list(...))
}

elem_range_slider <- function(min, max, step, value = min) {
  list(min = min, max = max, step = step, value = value)
}

on_change_filter <- function(elem, layer_id, property, operator = "==") {
  modifyList(elem, list(mapboxLayerId = layer_id, mapboxProperty = property, mapboxOperator = operator))
}

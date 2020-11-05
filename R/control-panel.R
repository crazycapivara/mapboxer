add_control_panel <- function(map, ..., pos = NULL) {
  invoke_method(map, "addCustomControl", controlName = "PanelControl",
                options = list(items = list(...)), pos = pos)
}

int_filder_slider <- function() {

}

elem_range_slider <- function(min, max, step, value = min) {
  list(props = list(min = min, max = max, step = step, value = value), type = "Slider")
}

on_change_filter <- function(elem, layer_id, property, operator = "==") {
  #modifyList(elem, list(mapboxLayerId = layer_id, mapboxProperty = property, mapboxOperator = operator))
  elem$filter <- list(layerId = layer_id, property = property, operator = operator)
  elem
}

add_control_panel <- function(map, ...) {
  invoke_method(map, "addCustomControl", controlName = "XYZControl",
                options = list(elem_range_slider(0, 6, 1, 2)))
}

elem_range_slider <- function(min, max, step, value) {
  list(min = min, max = max, step = step, value = value)
}

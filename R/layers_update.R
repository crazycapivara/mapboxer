set_paint_property <- function(map, layer, property, value) {
  map %>%
    invoke_method("setPaintProperty", layer = layer, property = sub("_", "-", property), value = value)
}

set_layout_property <- function(map, layer, property, value) {
  if (property == "visibility" & is.logical(value)) {
    value = ifelse(value, "visible", "none")
  }

  map %>%
    invoke_method("setLayoutProperty", layer = layer, property = property, value = value)
}

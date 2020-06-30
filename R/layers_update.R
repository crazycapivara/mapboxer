set_paint_property <- function(map, layer, property, value) {
  map %>%
    invoke_method("setPaintProperty", layer = layer, property = sub("_", "-", property), value = value)
}

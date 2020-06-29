set_filter <- function(map, layer, filter) {
  map %>%
    invoke_method("setFilter", layer = layer, filter = filter)
}

add_source <- function(map, data, id, type = "geojson") {
  map %>%
    invoke_method("addSource", id = id, source = list(data = data, type = type))
}

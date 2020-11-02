add_deckgl_layer <- function(map, type, data, ..., id = "deckgl-layer") {
  map %<>%
    add_deps(use_deps("deck-gl"))
  invoke_method(map, "addDeckLayer", type = type,
                props = list(data = data, id = id, ...))
}

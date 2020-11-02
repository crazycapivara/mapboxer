#' Add a deck.gl layer to the map (experimental)
#' @param map A \link{mapboxer} object
#' @param type The type of the deck.gl layer, e. g. \code{ScatterplotLayer}.
#' @param data The data object.
#' @param ... The properties of the layer.
#' @param id The unique ID of the layer
#' @example examples/api-reference/deckgl-layer.R
#' @export
add_deckgl_layer <- function(map, type, data, ..., id = "deckgl-layer") {
  map %<>%
    add_deps(use_deps("deck-gl"))
  invoke_method(map, "addDeckLayer", type = type,
                props = list(data = data, id = id, ...))
}

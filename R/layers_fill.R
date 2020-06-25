add_fill_layer <- function(
                           map,
                           fill_antialias = TRUE,
                           fill_color = "#000000",
                           fill_opacity = 1,
                           fill_outline_color = NULL,
                           fill_pattern = NULL,
                           fill_sort_key = NULL,
                           fill_translate = NULL,
                           fill_translate_anchor = NULL,
                           visibility = TRUE,
                           popup = NULL,
                           id = "fill-layer") {
  paint <- list(
    "fill-antialias" = fill_antialias,
    "fill-color" = fill_color,
    "fill-opacity" = fill_opacity,
    "fill-outline-color" = fill_outline_color,
    "fill-pattern" = fill_pattern,
    "fill-translate" = fill_translate,
    "fill-translate-anchor" = fill_translate_anchor
  )
  layout <- list(
    "fill-sort-key" = fill_sort_key,
    "visibility" = ifelse(visibility, "visible", "none")
  )
  style <- list(
    id = id,
    type = "fill",
    paint = purrr::compact(paint),
    layout = purrr::compact(layout)
  )
  map %>%
    add_layer(style, popup)
}

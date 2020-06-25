#' Add a fill layer to the map
#' @param source A Mapbox source. Uses the source from the \link{mapboxer} object if no source is supplied.
#' @param filter A filter expression that is applied to the \code{source}.
#' @param fill_antialias (paint) Whether or not the fill should be antialiased.
#' @param fill_color (paint) The color of the filled part of this layer.
#'   This color can be specified as rgba with an alpha component and
#'   the color's opacity will not affect the opacity of the 1px stroke, if it is used.
#' @param fill_opacity (paint) The opacity of the entire fill layer.
#'   In contrast to the \code{fill_color}, this value will also affect the 1px stroke around the fill,
#'   if the stroke is used.
#' @param fill_outline_color (paint) The outline color of the fill.
#'   Matches the value of \code{fill_color} if unspecified.
#' @param fill_pattern (paint) Name of image in sprite to use for drawing image fills.
#' @param fill_sort_key (layout) Sorts features in ascending order based on this value.
#'   Features with a higher sort key will appear above features with a lower sort key.
#' @param fill_translate (paint) The geometry's offset.
#'   Values are [x, y] where negatives indicate left and up, respectively.
#' @param fill_translate_anchor (paint) Controls the frame of reference for \code{fill_translate}.
#'   One of "map", "viewport".
#' @param visibility (layout) Whether the layer should be displayed.
#' @inheritParams add_popup
#' @param id The unique id of the layer.
#' @seealso \url{https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/#fill}
#' @example inst/api-reference/fill-layer.R
#' @export
add_fill_layer <- function(
                           map,
                           source = NULL,
                           filter = NULL,
                           fill_antialias = TRUE,
                           fill_color = NULL,
                           fill_opacity = NULL,
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
  style <- create_layer_style(id, "fill", source, filter, paint, layout)
  map %>%
    add_layer(style, popup)
}

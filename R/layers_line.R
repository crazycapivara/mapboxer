#' Add a line layer to the map
#' @inheritParams add_fill_layer
#' @param line_blur (paint) Blur applied to the line, in pixels.
#' @param line_cap (layout) The display of line endings.
#'   One of "butt", "round", "square".
#' @param line_color (paint) The color with which the line will be drawn.
#' @param line_dasharray (paint) Specifies the lengths of the alternating dashes
#'   and gaps that form the dash pattern.
#' @param line_gap_width (paint) Draws a line casing outside of a line's actual path.
#'   The value indicates the width of the inner gap.
#' @param line_gradient (paint) Defines a gradient with which to color a line feature.
#'   Can only be used with GeoJSON sources that specify \code{lineMetrics = TRUE}.
#' @param line_join (layout) The display of lines when joining.
#'   One of "bevel", "round", "miter".
#' @param line_miter_limit (layout) Used to automatically convert miter joins to bevel joins for sharp angles.
#'    Requires \code{line_join} to be "miter".
#' @param line_offset (paint) The line's offset.
#'   For linear features, a positive value offsets the line to the right,
#'   relative to the direction of the line, and a negative value to the left.
#'   For polygon features, a positive value results in an inset, and a negative value results in an outset.
#' @param line_opacity (paint) The opacity at which the line will be drawn.
#' @param line_pattern (paint) Name of image in sprite to use for drawing image lines.
#' @param line_round_limit (layout) Used to automatically convert round joins to miter joins for shallow angles.
#' @param line_sort_key (layout) Sorts features in ascending order based on this value.
#'   Features with a higher sort key will appear above features with a lower sort key.
#' @param line_translate (paint) The geometry's offset. Values are [x, y] where negatives indicate left and up, respectively.
#' @param line_translate_anchor (paint) Controls the frame of reference for \code{line_translate}.
#' @param line_width (paint) Stroke thickness.
#' @seealso \url{https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/#line}
#' @example inst/api-reference/line-layer.R
#' @export
add_line_layer <- function(map,
                           source = NULL,
                           filter = NULL,
                           line_blur = NULL,
                           line_cap = NULL,
                           line_color = NULL,
                           line_dasharray = NULL,
                           line_gap_width = NULL,
                           line_gradient = NULL,
                           line_join = NULL,
                           line_miter_limit = NULL,
                           line_offset = NULL,
                           line_opacity = NULL,
                           line_pattern = NULL,
                           line_round_limit = NULL,
                           line_sort_key = NULL,
                           line_translate = NULL,
                           line_translate_anchor = NULL,
                           line_width = NULL,
                           visibility = NULL,
                           popup = NULL,
                           id = "line-layer") {
  paint <- list(
    "line-blur" = line_blur,
    "line-color" = line_color,
    "line-dasharray" = line_dasharray,
    "line-gap-width" = line_gap_width,
    "line-gradient" = line_gradient,
    "line-offset" = line_offset,
    "line-opacity" = line_opacity,
    "line-pattern" = line_pattern,
    "line-translate" = line_translate,
    "line-translate-anchor" = line_translate_anchor,
    "line-width" = line_width
  )
  layout <- list(
    "line-cap" = line_cap,
    "line-join" = line_join,
    "line-miter-limit" = line_miter_limit,
    "line-round-limit" = line_round_limit,
    "line-sort-key" = line_sort_key,
    "visibility" = ifelse(visibility, "visible", "none")
  )
  style <- create_layer_style(id, "line", source, filter, paint, layout)
  map %>%
    add_layer(style, popup)
}

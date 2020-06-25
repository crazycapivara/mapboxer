#' Add a circle layer to the map
#' @inheritParams add_fill_layer
#' @param circle_blur (paint) Amount to blur the circle.
#'   1 blurs the circle such that only the centerpoint is full opacity.
#' @param circle_color (paint) The fill color of the circle.
#' @param circle_opacity (paint) The opacity at which the circle will be drawn.
#' @param circle_pitch_alignment (paint) Orientation of circle when map is pitched.
#'   One of "map", "viewport".
#' @param circle_pitch_scale (paint) Controls the scaling behavior of the circle when the map is pitched.
#'   One of "map", "viewport".
#' @param circle_radius (paint) The radius of the circle.
#' @param circle_sort_key (layout) Sorts features in ascending order based on this value.
#'   Features with a higher sort key will appear above features with a lower sort key.
#' @param circle_stroke_color (paint) The stroke color of the circle.
#' @param circle_stroke_opacity (paint) The opacity of the circle's stroke.
#' @param circle_stroke_width (paint) The width of the circle's stroke.
#'   Strokes are placed outside of the \code{circle_radius}.
#' @param circle_translate (paint) The geometry's offset.
#'   Values are [x, y] where negatives indicate left and up, respectively.
#' @param circle_translate_anchor (paint) Controls the frame of reference for \code{circle_translate}.
#'   One of "map", "viewport".
#' @seealso \url{https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/#circle}
#' @example examples/circle-layer.R
#' @export
add_circle_layer <- function(map,
                             source = NULL,
                             filter = NULL,
                             circle_blur = NULL,
                             circle_color = NULL,
                             circle_opacity = NULL,
                             circle_pitch_alignment = NULL,
                             circle_pitch_scale = NULL,
                             circle_radius = NULL,
                             circle_sort_key = NULL,
                             circle_stroke_color = NULL,
                             circle_stroke_opacity = NULL,
                             circle_stroke_width = NULL,
                             circle_translate = NULL,
                             circle_translate_anchor = NULL,
                             visibility = TRUE,
                             popup = NULL,
                             id = "circle-layer"
                             ) {
  paint = list(
    "circle-blur" = circle_blur,
    "circle-color" = circle_color,
    "circle-opacity" = circle_opacity,
    "circle-pitch-alignment" = circle_pitch_alignment,
    "circle-pitch-scale" = circle_pitch_scale,
    "circle-radius" = circle_radius,
    "circle_sort_key" = circle_sort_key,
    "circle-stroke-color" = circle_stroke_color,
    "circle-stroke-opacity" = circle_stroke_opacity,
    "circle-stroke-width" = circle_stroke_width,
    "circle-translate" = circle_translate,
    "circle_translate_anchor" = circle_translate_anchor
  )
  layout <- list(
    "circle-sort-key" = circle_sort_key,
    "visibility" = ifelse(visibility, "visible", "none")
  )
  style <- list(
    id = id,
    type = "circle",
    source = source,
    filter = filter,
    paint = purrr::compact(paint),
    layout = purrr::compact(layout)
  )
  map %>%
    add_layer(purrr::compact(style), popup)
}

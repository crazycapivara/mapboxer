#' Add a fill extrusion layer to the map
#' @inheritParams add_fill_layer
#' @param fill_extrusion_base (paint) The height with which to extrude the base of this layer.
#'   Must be less than or equal to \code{fill_extrusion_height}.
#' @param fill_extrusion_color (paint) The (base) color of the extruded fill.
#' @param fill_extrusion_height (paint) The height with which to extrude this layer. Units in meters.
#' @param fill_extrusion_opacity (paint) The opacity of the entire fill extrusion layer.
#'   This is rendered on a per-layer, not per-feature, basis, and data-driven styling is not available.
#' @param fill_extrusion_pattern (paint) Name of image in sprite to use for drawing images on extruded fills.
#'   For seamless patterns, image width and height must be a factor of two (2, 4, 8, ..., 512).
#' @param fill_extrusion_translate (paint) The geometry's offset. Values are [x, y] where negatives indicate left and up (on the flat plane), respectively.
#'   Units in pixels.
#' @param fill_extrusion_translate_anchor (paint) Controls the frame of reference for \code{fill_extrusion_translate}.
#'   One of "map", "viewport".
#' @param fill_extrusion_vertical_gradient (paint) Whether to apply a vertical gradient to the sides of a fill-extrusion layer.
#'   If true, sides will be shaded slightly darker farther down.
#' @seealso \url{https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/#fill-extrusion}
#' @example examples/api-reference/fill-extrusion-layer.R
#' @export
add_fill_extrusion_layer <- function(map,
                                     source = NULL,
                                     filter = NULL,
                                     fill_extrusion_base = NULL,
                                     fill_extrusion_color = NULL,
                                     fill_extrusion_height = NULL,
                                     fill_extrusion_opacity = NULL,
                                     fill_extrusion_pattern = NULL,
                                     fill_extrusion_translate = NULL,
                                     fill_extrusion_translate_anchor = NULL,
                                     fill_extrusion_vertical_gradient = NULL,
                                     visibility = c("visible", "none"),
                                     popup = NULL,
                                     id = "fill-extrusion-layer") {
  paint <- list(
    "fill-extrusion-base" = fill_extrusion_base,
    "fill-extrusion-color" = fill_extrusion_color,
    "fill-extrusion-height" = fill_extrusion_height,
    "fill-extrusion-opacity" = fill_extrusion_opacity,
    "fill-extrusion-pattern" = fill_extrusion_pattern,
    "fill-extrusion-translate" = fill_extrusion_translate,
    "fill-extrusion-translate-anchor" = fill_extrusion_translate_anchor,
    "fill-extrusion-vertical-gradient" = fill_extrusion_vertical_gradient
  )
  layout <- list(
    visibility = match.arg(visibility)
  )
  style <- create_layer_style(id, "fill-extrusion", source, filter, paint, layout)
  map %>%
    add_layer(style, popup)
}

#' Use a Carto map style
#' @param theme The theme of the style, \code{dark-matter}, \code{positron} or \code{voyager}.
#' @export
use_carto_style <- function(theme = "dark-matter") {
  if (!theme %in% c("dark-matter", "voyager", "positron")) {
    stop("Unknown theme.")
  }

  sprintf("https://basemaps.cartocdn.com/gl/%s-gl-style/style.json", theme)
}

#' Use a single color as map style
#' @param color The color of the background.
#' @export
use_background_style <- function(color = "#111") {
  style <- read_style("background-style.yml")
  style$layers[[1]]$paint$`background-color` <- color
  style
}

#' Use a stamen raster map style
#' @export
use_stamen_raster_style <- function() {
  use_raster_style()
}

use_raster_style <- function(tiles = NULL, attribution = NULL) {
  read_style("stamen-raster-style.yml")
}

read_style <- function(filename) {
  file.path("styles", filename) %>%
    system.file(package = getPackageName()) %>%
    yaml::read_yaml()
}

#' Set the style of the map
#' @inheritParams set_view_state
#' @inheritParams mapboxer
#' @export
set_style <- function(map, style) {
  map$x$mapProps$style = style
  map
}

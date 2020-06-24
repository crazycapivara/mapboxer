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

#' Use stamen raster tiles as map style
#' @param theme The theme of the tiles.
#' @export
use_stamen_raster_style <- function(theme = "watercolor") {
  tiles <- paste0("//stamen-tiles-", letters[1:3], ".a.ssl.fastly.net/", theme, "/{z}/{x}/{y}.png") %>%
    as.list()
  use_raster_style(tiles)
}

use_raster_style <- function(tiles = NULL, attribution = NULL) {
  style <- get_style_file("stamen-raster-style.yml") %>%
    read_style()
  if (!is.null(tiles)) {
    style$sources$`raster-tiles`$tiles <- tiles
  }

  if (!is.null(attribution)) {
    style$sources$`raster-tiles`$attribution <- attribution
  }

  style
}

get_osm_raster_tiles <- function() {
  paste0("//", c(letters[1:3]), ".tile.openstreetmap.org/{z}/{x}/{y}.png") %>%
    as.list()
}

read_style <- function(filename) {
    yaml::read_yaml(filename)
}

get_style_file <- function(filename) {
  file.path("styles", filename) %>%
    system.file(package = getPackageName())
}

#' Set the style of the map
#' @inheritParams set_view_state
#' @inheritParams mapboxer
#' @export
set_style <- function(map, style) {
  map$x$mapProps$style = style
  map
}

#' Use Carto vector tiles as map style
#' @param theme The theme of the style, \code{dark-matter}, \code{positron} or \code{voyager}.
#' @export
basemap_carto_style <- function(theme = "dark-matter") {
  if (!theme %in% c("dark-matter", "voyager", "positron")) {
    stop("Unknown theme.")
  }

  sprintf("https://basemaps.cartocdn.com/gl/%s-gl-style/style.json", theme)
}

#' Use a background color as map style
#' @param color The color of the background.
#' @export
use_background_style <- function(color = "#111") {
  style <- get_style_file("background-style.yml") %>%
    read_style()
  style$layers[[1]]$paint$`background-color` <- color
  style
}

#' Use Stamen raster tiles as map style
#' @param theme The theme of the tiles.
#' @export
use_stamen_raster_style <- function(theme = "watercolor") {
  paste0("//stamen-tiles-", letters[1:3], ".a.ssl.fastly.net/", theme, "/{z}/{x}/{y}.png") %>%
    as.list() %>%
    structure(attribution = STAMEN_ATTRIBUTION) %>%
    use_raster_style()
}

#' Use raster tiles as map style
#' @param tiles A list of tile urls.
#' @param attribution The attribution text of the tile layer.
#' @export
use_raster_style <- function(tiles = get_osm_raster_tiles(), attribution = NULL) {
  if (is.null(attribution) & !is.null(attributes(tiles)$attribution)) {
    attribution <- attributes(tiles)$attribution
  }

  style <- get_style_file("stamen-raster-style.yml") %>%
    read_style()
  style$sources$`raster-tiles`$tiles <- tiles
  style$sources$`raster-tiles`$attribution <- attribution
  style
}

#' Get OSM raster tile urls
#' @export
get_osm_raster_tiles <- function() {
  paste0("//", c(letters[1:3]), ".tile.openstreetmap.org/{z}/{x}/{y}.png") %>%
    as.list() %>%
    structure(attribution = OSM_ATTRIBUTION)
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
set_map_style <- function(map, style) {
  map$x$mapProps$style <- style
  map
}

create_layer_style <- function(id, type, source, filter, paint, layout) {
  list(
    id = id,
    type = type,
    source = source,
    filter = filter,
    paint = purrr::compact(paint),
    layout = purrr::compact(layout)
  ) %>%
    purrr::compact()
}

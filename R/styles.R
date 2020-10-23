#' Create a background style
#' @param color The color of the background.
#' @export
basemap_background_style <- function(color = "#111") {
  style <- get_style_file("background-style.yml") %>%
    read_style()
  style$layers[[1]]$paint$`background-color` <- color
  style
}

#' Create a raster style
#' @param tiles A list of tile urls.
#' @param attribution The attribution text of the tile layer.
#' @export
basemap_raster_style <- function(tiles = get_osm_raster_tiles(), attribution = NULL) {
  if (utils_has_attr(tiles, "attribution")) {
    attribution <- attributes(tiles)$attribution
  }

  style <- get_style_file("stamen-raster-style.yml") %>%
    read_style()
  style$sources$`raster-tiles`$tiles <- tiles
  style$sources$`raster-tiles`$attribution <- attribution
  style
}

#' Get OSM raster tile URLs
#' @export
get_osm_raster_tiles <- function() {
  sprintf("//%s.tile.openstreetmap.org/{z}/{x}/{y}.png", c(letters[1:3])) %>%
    structure(attribution = OSM_ATTRIBUTION)
}

#' Get Stamen raster tile URLs
#' @param theme The theme of the tiles.
#' @export
get_stamen_raster_tiles <- function(theme = "watercolor") {
  sprintf("//stamen-tiles-%s.a.ssl.fastly.net/%s/{z}/{x}/{y}.png", letters[1:3], theme) %>%
    structure(attribution = STAMEN_ATTRIBUTION)
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

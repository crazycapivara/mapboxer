#' Create a background style
#'
#' Creates a background style that can be used as basemap.
#' @param color The color of the background.
#' @param opacity The opacity of the background.
#' @export
basemap_background_style <- function(color = "#111", opacity = 1) {
  background_layer <- list(
    id = "background",
    type = "background",
    paint = list(
      "background-color" = color,
      "background-opacity" = opacity
    )
  )
  list(
    version = 8,
    layers = list(background_layer)
  )
}

#' Create a raster style
#'
#' Creates a raster style that can be used as a basemap.
#' @param tiles A list of tile URLs.
#' @param attribution The attribution text of the tile layer.
#' @export
basemap_raster_style <- function(tiles = stamen_raster_tiles("terrain"), attribution = NULL) {
  if (utils_has_attr(tiles, "attribution")) {
    attribution <- attributes(tiles)$attribution
  }

  raster_source <- list(
    type = "raster",
    tiles = tiles,
    tileSize = 256,
    attribution = attribution
  )

  raster_layer <- list(
    id = "simple-tiles",
    type = "raster",
    source = "raster-tiles",
    minzoom = 0,
    maxzoom = 22
  )

  list(
    version = 8,
    sources = list(
      "raster-tiles" = raster_source
    ),
    layers = list(raster_layer)
  )
}

### obsolete, maybe add 'osm_raster_tiles' as data
get_osm_raster_tiles <- function() {
  sprintf("//%s.tile.openstreetmap.org/{z}/{x}/{y}.png", c(letters[1:3])) %>%
    structure(attribution = OSM_ATTRIBUTION)
}

### obsolete
get_stamen_raster_tiles <- function(theme = "watercolor") {
  sprintf("//stamen-tiles-%s.a.ssl.fastly.net/%s/{z}/{x}/{y}.png", letters[1:3], theme) %>%
    structure(attribution = STAMEN_ATTRIBUTION)
}

### ---
stamen_attribution <- list(
  default = 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, under <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>, under <a href="http://www.openstreetmap.org/copyright">ODbL</a>.',
  watercolor = 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, under <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>, under <a href="http://creativecommons.org/licenses/by-sa/3.0">CC BY SA</a>.'
)

#' Get Stamen raster tile URLs
#' @param theme The theme of the tiles.
#' @export
stamen_raster_tiles <- function(theme = c("watercolor")) {
  attribution <- ifelse(theme == "watercolor",
                        stamen_attribution$watercolor,
                        stamen_attribution$default)
  sprintf("//stamen-tiles-%s.a.ssl.fastly.net/%s/{z}/{x}/{y}.png", letters[1:4], theme) %>%
    structure(attribution = attribution)
}
### ---

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
  if (inherits(map, "mapboxer_proxy")) {
    return(invoke_method(map, "setStyle", style = style))
  }

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

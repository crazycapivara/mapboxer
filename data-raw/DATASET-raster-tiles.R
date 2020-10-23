url_stamen <- "https://stamen-tiles.a.ssl.fastly.net/{{theme}}/{z}/{x}/{y}.png"
themes_stamen_toner <- c(
  "toner",
  "toner-hybrid",
  "toner-labels",
  "toner-lines",
  "toner-background",
  "toner-lite",

  "terrain",
  "terrain-labels",
  "terrain-lines",
  "terrain-background"
)

stamen_atttribution <- 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, under <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>, under <a href="http://www.openstreetmap.org/copyright">ODbL</a>.'

raster_tiles_stamen <- lapply(themes_stamen_toner, function(theme) {
  whisker::whisker.render(url_stamen, list(theme = theme)) %>%
    structure(attribution = stamen_atttribution)
})

mapboxer(zoom = 4, style = basemap_raster_style(raster_tiles_stamen[[10]])) %>%
  add_navigation_control()

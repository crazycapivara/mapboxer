### OBSOLETE - delete file

PROVIDERS <- list(
  Carto = list(
    url = "https://basemaps.cartocdn.com/gl/%s-gl-style/style.json",
    themes = c("dark-matter", "voyager", "positron")
  ),
  Mapbox = list(
    url = "mapbox://styles/mapbox/%s",
    themes = c("streets-v11", "outdoors-v11", "light-v10", "dark-v10", "satellite-v9", "satellite-steets-v11")
  )
)

build_urls <- function(provider) {
  urls <- list()
  for (theme in provider$themes) {
    urls[[gsub("-", "_", theme)]] <- sprintf(provider$url, theme)
  }

  urls
}

### OBSOLETE
get_basemaps <- function() {
  lapply(PROVIDERS, build_urls)
}

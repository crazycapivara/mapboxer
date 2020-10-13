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

build_style_url_list <- function(provider) {
  urls <- list()
  for (theme in provider$themes) {
    urls[[gsub("-", "_", theme)]] <- sprintf(provider$url, theme)
  }

  urls
}

#' Get list of basemaps
#' @example examples/api-reference/basemaps.R
#' @export
get_basemaps <- function() {
 list(
   Carto = build_style_url_list(PROVIDERS$Carto),
   Mapbox = build_style_url_list(PROVIDERS$Mapbox)
  )
}

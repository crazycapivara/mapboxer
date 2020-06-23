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
    list(
    version = 8,
    layers = list(
      list(
        id = "background",
        type =  "background",
        paint = list(
          "background-color" = color
        )
      )
    )
  )
}

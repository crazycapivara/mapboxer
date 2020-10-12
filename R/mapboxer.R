#' Create a mapboxer widget
#'
#' @param source A \link{mapbox_source} that is added to the map with the ID \code{MAPBOXER}.
#' @param style The map's Mapbox style.
#' @param ... The properties of the map, see \url{https://docs.mapbox.com/mapbox-gl-js/api/map/}.
#' @param width The width of the widget.
#' @param height The height of the widget.
#' @param element_id The unique ID of the widget.
#' @param token A Mapbox API access token. Only needed if you want to use styles from Mapbox.
#' @export
mapboxer <- function(source = NULL, style = basemap_carto_style(), ...,
                     width = NULL, height = NULL, element_id = NULL,
                     token = Sys.getenv("MAPBOX_API_TOKEN")) {
  widget_data <- list(
    source = source,
    calls = list(),
    mapProps = list(
      style = style,
      ...
    ),
    accessToken = token
  )

  htmlwidgets::createWidget(
    name = "mapboxer",
    x = widget_data,
    width = width,
    height = height,
    package = "mapboxer",
    elementId = element_id,
    dependencies = use_deps("mapbox-gl")
  )
}

#' Shiny bindings for mapboxer
#'
#' Output and render functions for using mapboxer within Shiny
#' applications and interactive Rmd documents.
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a mapboxer
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#' @name mapboxer-shiny
#' @example examples/api-reference/shiny.R
#' @export
mapboxerOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "mapboxer", width, height, package = "mapboxer")
}

#' @rdname mapboxer-shiny
#' @export
renderMapboxer <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(expr, mapboxerOutput, env, quoted = TRUE)
}

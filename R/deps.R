#' @importFrom methods getPackageName
read_deps <- function(pkg_name = getPackageName()) {
  system.file("htmlwidgets/deps.yaml", package = pkg_name) %>%
    yaml::read_yaml()
}

use_deps <- function(dep_names) {
  deps <- read_deps()
  if (!all(dep_names %in% names(deps))) {
    stop("available deps [", paste(names(deps), collapse = ", "), "]")
  }

  lapply(deps[dep_names], function(dep) {
    do.call(htmltools::htmlDependency, dep)
  })
}

add_deps <- function(widget, deps) {
  widget$dependencies <- c(widget$dependencies, deps)
  widget
}


#' Switch between Mapbox GL JS v1 or v2 in a mapboxer project
#'
#' @param use_v2 If \code{TRUE}, mapboxer will use Mapbox GL JS version 2, which includes new features (such as Globe view and non-Mercator projections) but is less permissively licensed than Mapbox GL JS v1.  Please review the Mapbox terms of service at https://www.mapbox.com/legal/tos/ for more information.
#'
#' @return Returns the vale of \code{use_v2} invisibly.
#' @export
#' @examples \dontrun{
#'
#' library(mapboxer)
#' mapboxer_use_v2(TRUE)
#'
#' # Globe view is only available in V2
#' mapboxer(
#'  center = c(-73.9165, 40.7114),
#'  style = basemaps$Mapbox$streets_v11,
#'  zoom = 2,
#'  projection = "globe"
#' )
#'
#' }
mapboxer_use_v2 <- function(use_v2) {

  current_opt <- getOption("mapbox_version", default = "mapbox-gl")

  if (use_v2) {

    if (current_opt != "mapbox-gl2") {
      options(mapbox_version = "mapbox-gl2")
      message("Using Mapbox GL JS v2.\nPlease review the Mapbox terms of service for version 2\nat https://www.mapbox.com/legal/tos/.")
      invisible(use_v2)

    }

  } else {
    if (current_opt != "mapbox-gl") {
      options(mapbox_version = "mapbox-gl")
      message("Using Mapbox GL JS v1.")
      invisible(use_v2)
    }
  }

}

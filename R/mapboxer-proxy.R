MAPBOXER_PROXY_CLASS <- "mapboxer_proxy"

#' Create a mapboxer proxy object
#'
#' Create a \code{\link{mapboxer}}-like object that can be used to update a mapboxer object
#' that has already been rendered in a Shiny app.
#' @param shiny_id The output ID of the mapboxer object that should be updated.
#' @param session The current Shiny session object. Usually the default value can be used.
#' @seealso \link{update_mapboxer}
#' @export
mapboxer_proxy <- function(shiny_id, session = shiny::getDefaultReactiveDomain()) {
  if (is.null(session)) {
    stop("'", MAPBOXER_PROXY_CLASS, "' must be called from the server function of a Shiny app.")
  }

  if (!is.null(session$ns) &&
      nzchar(session$ns(NULL)) &&
      substring(shiny_id, 1, nchar(session$ns(""))) != session$ns("")) {
    shinyId <- session$ns(shiny_id)
  }

  # message("Shiny ID: ", shiny_id)
  structure(
    list(
      session = session,
      id = shiny_id,
      x = list(
        calls = list()
      )
    ),
    class = c(MAPBOXER_PROXY_CLASS, "htmlwidget_proxy")
  )
}

#' Update a mapboxer proxy object in a Shiny app
#' @param proxy_obj A \code{\link{mapboxer_proxy}} object.
#' @param ... unused
#' @export
update_mapboxer <- function(proxy_obj, ...) {
  if (!inherits(proxy_obj, MAPBOXER_PROXY_CLASS)) {
    stop("This function must be used with a '", MAPBOXER_PROXY_CLASS, "' object.")
  }

  proxy_obj$session$sendCustomMessage(
    type = "mapboxer",
    message <- list(
      id = proxy_obj$id,
      test = list(...),
      widgetData = proxy_obj$x
    )
  )
  proxy_obj
}

MAPBOXER_PROXY_CLASS <- "mapboxer_proxy"

mapboxer_proxy <- function(shiny_id, session = shiny::getDefaultReactiveDomain()) {
  if (is.null(session)) {
    stop("'", MAPBOXER_PROXY_CLASS, "' must be called from the server function of a Shiny app.")
  }

  if (!is.null(session$ns) &&
      nzchar(session$ns(NULL)) &&
      substring(shiny_id, 1, nchar(session$ns(""))) != session$ns("")) {
    shinyId <- session$ns(shiny_id)
  }

  message("Shiny ID: ", shiny_id)
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

send_update <- function(proxy_obj, ...) {
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

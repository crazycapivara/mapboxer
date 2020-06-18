invoke_method <- function(widget, method_name, ...) {
  pos <- length(widget$x$calls) + 1
  widget$x$calls[[pos]] <- list(
    methodName = method_name,
    args = list(...) %>%
      purrr::compact()
  )
  widget
}

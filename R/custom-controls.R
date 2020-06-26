#' Add a text control to the map
#' @inheritParams add_control
#' @param text The text (HTML) that is displayed.
#' @param cssText The \code{cssText} property of the control element.
#' @export
add_text_control <- function(map, text, cssText = NULL, pos = NULL) {
  options <- list(text = text, cssText = cssText)
  map %>%
    invoke_method("addCustomControl", controlName = "TextControl", pos = pos, options = options)
}

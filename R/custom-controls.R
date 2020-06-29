#' Add a text control to the map
#' @inheritParams add_control
#' @param text The text (HTML) that is displayed.
#' @param css_text A \code{cssText} string that will modify the style of the control element.
#' @export
add_text_control <- function(map, text, pos = NULL, css_text = NULL) {
  options <- list(text = text, cssText = css_text)
  map %>%
    invoke_method("addCustomControl", controlName = "TextControl", pos = pos, options = options)
}

#' Add a mouse position control to the map
#' @inheritParams add_text_control
#' @param mustache_template A \href{https://github.com/janl/mustache.js}{mustache} template
#'   that contains the mustache tags\code{lng} and \code{lat}.
#' @example examples/mouse-position-control.R
#' @export
add_mouse_position_control <- function(map, mustache_template = NULL, pos = NULL, css_text = NULL) {
  options <- list(mustacheTemplate = mustache_template, cssText = css_text)
  map %>%
    invoke_method("addCustomControl", controlName = "MousePositionControl", pos = pos, options = options)
}

#' Add a filter control to the map
#' @inheritParams add_text_control
#' @param layer The name/ID of the layer to which the filter is attached.
#' @param filter The initial filter expression.
#' @export
add_filter_control <- function(map, layer, filter = NULL, pos = NULL) {
  options = list(layer = layer, filter = filter)
  map %>%
    invoke_method("addCustomControl", controlName = "FilterControl", pos = pos, options = options)
}

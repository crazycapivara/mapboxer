#' Add a text control to the map
#' @inheritParams add_control
#' @param text The text (HTML) that is displayed.
#' @param css_text A \code{cssText} string that will modify the style of the control element.
#' @export
add_text_control <- function(map, text, pos = NULL, css_text = NULL) {
  options <- list(
    text = text,
    cssText = css_text
  )
  invoke_method(map, "addCustomControl", controlName = "TextControl", pos = pos, options = options)
}

#' Add a mouse position control to the map
#' @inheritParams add_text_control
#' @param mustache_template A \href{https://github.com/janl/mustache.js}{mustache} template
#'   that contains the mustache tags \code{lng} and \code{lat}.
#' @example examples/api-reference/mouse-position-control.R
#' @export
add_mouse_position_control <- function(map, mustache_template = NULL, pos = NULL, css_text = NULL) {
  options <- list(
    mustacheTemplate = mustache_template,
    cssText = css_text
  )
  invoke_method(map, "addCustomControl", controlName = "MousePositionControl", pos = pos, options = options)
}

#' Add a filter control to the map
#' @inheritParams add_text_control
#' @param layer_id The ID of the layer to which the filter is attached.
#' @param filter The initial filter expression.
#' @param rows The number of rows of the textarea input.
#' @param cols The number of columns of the textarea input.
#' @export
add_filter_control <- function(map, layer_id, filter = NULL, pos = NULL, rows = 1, cols = 20) {
  options <- list(
    layer = layer_id,
    filter = filter,
    textareaAttributes = list(rows = rows, cols = cols)
  )
  invoke_method(map, "addCustomControl", controlName = "FilterControl", pos = pos, options = options)
}

#' Add a legend control to the map
#' @param map A \link{mapboxer} object.
#' @param colors The colors of the legend items.
#' @param labels The labels of the legend items.
#' @param title The title of the legend.
#' @inheritParams add_control
#' @export
add_legend_control <- function(map, colors, labels, title = NULL,
                               pos = c("bottom-right", "bottom-left", "top-left", "top-right")) {
  items <- lapply(1:length(colors), function(i) list(color = colors[i], label = labels[i]))
  options <- list(
    items = items,
    title = title
  )
  invoke_method(map, "addCustomControl",
                controlName = "LegendControl", pos = match.arg(pos), options = options)
}

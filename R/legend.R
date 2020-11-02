add_legend_control <- function(map, colors, labels,
                               pos = c("bottom-right", "bottom-left", "top-left", "top-right")) {
  #invoke_method(map, "addLegendControl", pos = match.arg(pos), options = list())
  items <- lapply(1:length(colors), function(i) list(color = colors[i], label = labels[1]))
  options <- list(
    items = items
  )
  invoke_method(map, "addCustomControl",
                controlName = "LegendControl", pos = match.arg(pos), options = options)
}

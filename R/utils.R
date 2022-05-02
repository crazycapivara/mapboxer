utils_has_attr <- function(x, attr_name) {
  attr_name %in% names(attributes(x))
}

utils_shiny_tags_as_character <- function(x) {
  lapply(x, function(y) {
    if (inherits(y, "shiny.tag")) return(as.character(y))

    y
  })
}

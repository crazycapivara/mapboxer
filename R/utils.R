utils_has_attr <- function(x, attr_name) {
  attr_name %in% names(attributes(x))
}

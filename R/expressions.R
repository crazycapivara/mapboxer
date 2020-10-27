expr_get_property <- function(property_name) {
  c("get", property_name)
}

expr_gt <- function(value1, value2) {
  list("==", value1, value2)
}

expr_lt <- function(value1, value2) {
  list("<", value1, value2)
}

expr_le <- function(value1, value2) {
  list("<=", value1, value2)
}

expr_gt <- function(value1, value2) {
  list(">", value1, value2)
}

expr_ge <- function(value1, value2) {
  list(">=", value1, value2)
}

expr_all <- function(...) {
  list("all", ...)
}

expr_any <- function(...) {
  list("any", ...)
}

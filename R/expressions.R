expr_get_property <- function(property_name) {
  c("get", property_name)
}

expr_lt <- function(value1, value2) {
  list("<", value1, value2)
}

expr_le <- function(value1, value2) {
  list("<=", value1, value2)
}

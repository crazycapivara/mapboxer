get_version <- function() {
  getPackageName() %>%
    getNamespaceVersion()
}

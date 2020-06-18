read_deps <- function(pkg_name = getPackageName()) {
  system.file("htmlwidgets/deps.yaml", package = pkg_name) %>%
    yaml::read_yaml()
}

use_deps <- function(dep_names) {
  deps <- read_deps()
  if (!all(dep_names %in% names(deps))) {
    stop("available deps [", paste(names(deps), collapse = ", "), "]")
  }

  lapply(deps[dep_names], function(dep) {
    do.call(htmltools::htmlDependency, dep)
  })
}

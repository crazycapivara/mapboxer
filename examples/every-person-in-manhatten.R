library(mapboxer)
library(tibble)

data_url <- paste0(
  "https://raw.githubusercontent.com/",
  "uber-common/deck.gl-data/",
  "master/examples/scatterplot/manhattan.json"
)

colors <- list(
  male = "#0080FF",
  female = "#FF0080"
)

persons_sf <- data_url %>%
  jsonlite::read_json(simplifyVector = TRUE) %>%
  as_tibble(.name_repair = ~ c("lng", "lat", "sex")) %>%
  dplyr::mutate(
    sex = as.integer(sex),
    color = ifelse(data$sex == 1, colors$male, colors$female)
  ) %>%
  sf::st_as_sf(coords = c("lng", "lat"))

as_mapbox_source(persons_sf) %>%
  mapboxer(bounds = sf::st_bbox(persons_sf), bearing = 35, pitch = 40) %>%
  add_circle_layer(
    circle_color = c("get", "color"),
    circle_radius = 2
  ) %>%
  add_navigation_control()

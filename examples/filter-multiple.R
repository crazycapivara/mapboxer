library(mapboxer)
library(dplyr)

# js: ["all", ["in", "brand", "A", "B"], ["==", "injured", 1]]
filter <- list(
  "all",
  list("in", "brand", "A", "B"),
  list("==", "injured", 1)
)

motor_vehicle_collisions_nyc %>%
  mutate(
    brand = rep_len(c("A", "B", "C"), nrow(.)),
    color = rep_len(c("red", "blue", "green"), nrow(.))
  ) %>%
  as_mapbox_source() %>%
  mapboxer(
    center = c(-73.9165, 40.7114),
    zoom = 10
  ) %>%
  add_circle_layer(
    circle_color = c("get", "color"),
    popup = "{{brand}}, {{injured}}",
    id = "mvc"
  ) %>%
  add_filter_control(
    "mvc",
    # filter = list("in", "brand", "A", "B"),
    filter = filter,
    cols = 30,
    rows = 3,
    pos = "top-left"
  )

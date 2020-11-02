devtools::load_all()

data_url <- paste0(
  "https://raw.githubusercontent.com/plotly/datasets/master/",
  "2011_february_aa_flight_paths.csv"
)
flights <- data.table::fread(data_url)
head(flights)

mapboxer(
  center = c(-87.6500523, 41.850033),
  zoom = 2,
  pitch = 45
) %>%
  add_deckgl_layer(
    type = "ArcLayer",
    data = flights,
    getSourcePosition = htmlwidgets::JS("d => [d.start_lon, d.start_lat]"),
    getTargetPosition = htmlwidgets::JS("d => [d.end_lon, d.end_lat]"),
    getSourceColor = c(64, 255, 0),
    getTargetColor = c(0, 128, 200)
  ) %>%
  add_navigation_control()

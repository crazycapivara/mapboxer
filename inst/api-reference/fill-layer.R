fill_style <- list(
  id = "melbourne",
  type = "fill",
  source = "melbourne",
  paint = list(
    "fill-color" = "blue",
    "fill-opacity" = 0.7
  )
)

data <- geojsonsf::geo_melbourne

mapboxer() %>%
  add_source(data, "melbourne") %>%
  add_layer(fill_style)

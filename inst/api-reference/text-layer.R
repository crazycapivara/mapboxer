library(geojsonsf)

data <- geojson_sf(geo_melbourne)

text_style <- list(
  id = "text-layer",
  type = "symbol",
  source = "melbourne",
  layout = list(
    "text-field" = "{SA2_NAME}",
    "text-size" = 12
  ),
  paint = list(
    "text-color" = "white"
  )
)

mapboxer() %>%
  set_view_state(lng =  144.9624, lat = -37.8105) %>%
  add_source(data, "melbourne") %>%
  add_layer(text_style)

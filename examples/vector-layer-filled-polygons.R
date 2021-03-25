vector_src <- mapbox_source(
  type = "vector",
  url = "mapbox://mapbox.country-boundaries-v1"
)

SRC_ID <- "country-boundaries-data"

layer_style <- list(
  "id" = "country-boundaries",
  "type" = "fill",
  "source" = SRC_ID,
  "source-layer" = "country_boundaries",
  "paint" = list(
    "fill-color" = "blue",
    "fill-opacity" = 0.6
  )
)

mapboxer(
  style = basemaps$Carto$positron,
  center = c(0, 0),
  zoom = 1
) %>%
  add_source(vector_src, id = SRC_ID) %>%
  add_layer(layer_style)

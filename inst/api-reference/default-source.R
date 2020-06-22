library(geojsonsf)

data("geo_melbourne")

fill_style <- list(
  id = "melbourne",
  type = "fill",
  paint = list(
    "fill-color" = c("get", "fillColor"),
    "fill-opacity" = 0.7
  )
)

geo_melbourne %>%
  as_mapbox_source() %>%
  mapboxer() %>%
  set_view_state(lng =  144.9624, lat = -37.8105, zoom = 10, pitch = 35) %>%
  add_layer(fill_style, popup = "Area: {{AREASQKM}} km<sup>2</sup>")

fill_style <- list(
  id = "melbourne",
  type = "fill",
  source = "melbourne",
  paint = list(
    "fill-color" = c("get", "fillColor"),
    "fill-opacity" = 0.7
  )
)

data <- geojsonsf::geo_melbourne
data <- geojsonsf::geojson_sf(geojsonsf::geo_melbourne)
class(data)

mapboxer() %>%
  set_view_state(lng =  144.9624, lat = -37.8105) %>%
  add_source(data, "melbourne") %>%
  add_layer(fill_style)

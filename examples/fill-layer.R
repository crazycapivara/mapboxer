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
source <- as_mapbox_source(data)
class(source$data)

map <- mapboxer() %>%
  set_view_state(lng =  144.9624, lat = -37.8105) %>%
  add_source(source, "melbourne") %>%
  add_layer(fill_style, popup = "Area: {{AREASQKM}} km<sup>2</sup>") %>%
  add_filter_control(layer_id = "melbourne", filter = list("<", "AREASQKM", 2), rows = 2)
  #%>% add_marker(lng =  144.9624, lat = -37.8105, popup = "center")

if (interactive()) map

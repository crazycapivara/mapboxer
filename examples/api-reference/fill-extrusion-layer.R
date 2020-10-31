LAYER_ID <- "melbourne"

map <- mapboxer(
  center = c(144.9624, -37.8105),
  zoom = 11,
  pitch = 35
) %>%
  add_fill_extrusion_layer(
    source = as_mapbox_source(geojsonsf::geo_melbourne),
    fill_extrusion_color = c("get", "fillColor"),
    fill_extrusion_height = list("*", c("get", "AREASQKM"), 1000),
    popup = "Area: {{AREASQKM}} km<sup>2</sup>",
    id = LAYER_ID
  ) %>%
  add_filter_control(
    layer_id = LAYER_ID,
    filter = list("<", "AREASQKM", 2),
    rows = 2
  )

if (interactive()) map

image_src <- mapbox_source(
  type = "image",
  url = "https://docs.mapbox.com/mapbox-gl-js/assets/radar.gif",
  coordinates = list(
    c(-80.425, 46.437),
    c(-71.516, 46.437),
    c(-71.516, 37.936),
    c(-80.425, 37.936)
  )
)

raster_style <- list(
  id = "overlay",
  type = "raster",
  source = image_src,
  paint = list(
    "raster-opacity" = 0.85
  )
)

map <- mapboxer(
  center = c(-75.789, 41.874),
  zoom = 5
) %>%
  add_layer(raster_style)

if (interactive()) map

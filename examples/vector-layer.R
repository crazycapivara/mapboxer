vector_src <- mapbox_source(
  type = "vector",
  url = "mapbox://mapbox.mapbox-terrain-v2"
)

layer_style <- list(
  'id' = 'terrain-data',
  'type' = 'line',
  'source' = 'mapbox-terrain',
  'source-layer' = 'contour',
  'layout'= list (
    'line-join' = 'round',
    'line-cap'= 'round'
  ),
  'paint' = list (
    'line-color'= '#ff69b4',
    'line-width'= 1
  )
)

mapboxer(
  style = basemaps$Mapbox$light_v10,
  zoom = 13,
  center = c(-122.447303, 37.753574)
) %>%
  add_source(vector_src, id = "mapbox-terrain") %>%
  add_layer(layer_style)

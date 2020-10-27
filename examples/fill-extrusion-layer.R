floorplan_url <- "https://docs.mapbox.com/mapbox-gl-js/assets/indoor-3d-map.geojson"

floorplan_sf <- sf::st_read(floorplan_url)

map <- as_mapbox_source(floorplan_sf) %>%
  mapboxer(
    bounds = sf::st_bbox(floorplan_sf),
    pitch = 40,
    bearing = 20
  )

# Line Layer
map %>%
  add_line_layer(
    line_color = "red"
  )

# Fill Extrusion Layer
style <- list(
  id = "floorplan",
  type = "fill-extrusion",
  paint = list(
    "fill-extrusion-color" = c("get", "color"),
    "fill-extrusion-height" = c("get", "height"),
    "fill-extrusion-base" = c("get", "base_height"),
    "fill-extrusion-opacity" = 0.5
  )
)

map %>%
  add_layer(style) %>%
  add_tooltips("floorplan", "{{name}}")

basemaps <- get_basemaps()

map <- mapboxer(
  style = basemaps$Carto$positron,
  center = c(-73.9165, 40.7114),
  zoom = 4
)

if (interactive()) map

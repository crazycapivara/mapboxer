LAYER_ID <- "crashes"

mustache_tpl <- "
  <b>Date:</b> {{date}}</br>
  <b>Time:</b> {{time}}</br>
  <b>Number of persons injured:</b> {{injured}}
"

map <- motor_vehicle_collisions_nyc %>%
  as_mapbox_source() %>%
  mapboxer(
    center = c(-73.9165, 40.7114),
    zoom = 9
  ) %>%
  add_circle_layer(
    circle_color = "red",
    circle_blur = 1,
    filter = list(">", "injured", 0),
    id = LAYER_ID
  ) %>%
  add_popups(
    LAYER_ID,
    popup = mustache_tpl
  )

if (interactive()) map

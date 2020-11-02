mvc <- motor_vehicle_collisions_nyc
colors <- c("yellow", "red")
labels <- c("0", "> 0")

mvc$color <- ifelse(mvc$injured == 0, colors[1], colors[2])

map <- mvc %>%
  as_mapbox_source() %>%
  mapboxer(
    center = c(-73.9165, 40.7114),
    zoom = 10
  ) %>%
  add_circle_layer(
    circle_color = c("get", "color")
  ) %>%
  add_legend_control(
    colors, labels,
    title = "<b>Number of</br>persons injured</b>",
    pos = "bottom-left"
  )

if (interactive()) map

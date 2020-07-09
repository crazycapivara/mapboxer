quakes_map <- quakes %>%
  dplyr::mutate(
    color = ifelse(mag > 5, "red", "blue")
  ) %>%
  as_mapbox_source(lng = "long", lat = "lat") %>%
  mapboxer(
    center = c(176.9, -24.655),
    zoom = 4
  )
quakes_map %>%
  add_circle_layer(
    circle_color = list("get", "color")
  )

quakes_map %>%
  add_circle_layer(
    circle_color = list(
      "case",
      # 'red' if 'mag > 5'
      list(">", list("get", "mag"), 5), "red",
      # Defaults to 'blue'
      "blue"
    )
  )

# if (interactive()) quakes_map

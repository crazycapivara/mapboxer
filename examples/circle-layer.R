quakes %>%
  as_mapbox_source(lng = "long", lat = "lat") %>%
  mapboxer(center = c(176.9, -24.655), zoom = 4) %>%
  add_navigation_control() %>%
  add_circle_layer(
    circle_color = "blue",
    circle_blur = 1,
    circle_stroke_color = "red",
    circle_stroke_width = 1,
    popup = "{{mag}}")

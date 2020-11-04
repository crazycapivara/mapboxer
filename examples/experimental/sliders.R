LAYER_ID <- "crashes"

slider <- elem_range_slider(min = 0, max = 6, step = 1, value = 3) %>%
  on_change_filter(LAYER_ID, property = "injured", operator = ">=")

slider2 <- elem_range_slider(min = 0, max = 6, step = 1, value = 4) %>%
  on_change_filter(LAYER_ID, property = "injured", operator = "<=")

as_mapboxer_viz(motor_vehicle_collisions_nyc, coords = c("lng", "lat"), layer_id = LAYER_ID) %>%
  add_control_panel(
    slider,
    slider2,
    pos = "top-left"
  ) %>%
  add_popups(LAYER_ID, mapbox_popup("{{injured}}", event = "hover"))

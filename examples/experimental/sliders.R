LAYER_ID <- "crashes"

slider <- elem_range_slider(min = 0, max = 6, step = 1, value = 3) %>%
  on_change_filter(LAYER_ID, property = "injured", operator = "==")

as_mapboxer_viz(motor_vehicle_collisions_nyc, coords = c("lng", "lat"), layer_id = LAYER_ID) %>%
  add_control_panel(
    slider
  ) %>%
  add_popups(LAYER_ID, "{{injured}}")

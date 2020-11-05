LAYER_ID <- "crashes"

mvc <- motor_vehicle_collisions_nyc
mvc$day <- lubridate::day(mvc$date)

slider <- elem_range_slider(min = 0, max = 6, step = 1, value = 3) %>%
  on_change_filter(LAYER_ID, property = "injured", operator = ">=")

slider2 <- elem_range_slider(min = min(mvc$day), max = max(mvc$day), step = 1) %>%
  on_change_filter(LAYER_ID, property = "day", operator = "==")

as_mapboxer_viz(mvc, coords = c("lng", "lat"), layer_id = LAYER_ID) %>%
  add_control_panel(
    slider,
    slider2,
    pos = "top-left"
    , css_text = htmltools::css(background = "black", color = "white")
  ) %>%
  add_popups(LAYER_ID, mapbox_popup("{{injured}}", event = "hover"))

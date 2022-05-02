LAYER_ID <- "crashes"

mvc <- motor_vehicle_collisions_nyc
mvc$day <- lubridate::day(mvc$date)

slider <- elem_range_slider(min = 0, max = 6, step = 1, value = 3) %>%
  on_change_filter(LAYER_ID, property = "injured", operator = ">=")

slider2 <- elem_range_slider(min = min(mvc$day), max = max(mvc$day), step = 1) %>%
  on_change_filter(LAYER_ID, property = "day", operator = "==")

as_mapboxer_viz(mvc, coords = c("lng", "lat"), layer_id = LAYER_ID, visibility = "none") %>%
  add_control_panel(
    "<p><b>Number of persons <i>injured</i></b></p>",
    slider,
    "<p><b>2019-09-<i>day</i></b></p>",
    slider2,
    layer_visibility_checkbox(LAYER_ID),
    pos = "top-left"
    , css_text = htmltools::css(width = "220px")
    #, css_text = htmltools::css(background = "black", color = "white")
  ) %>%
  add_popups(LAYER_ID, mapbox_popup("{{injured}}", event = "hover"))

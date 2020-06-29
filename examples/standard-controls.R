map <- mapboxer() %>%
  add_navigation_control(
    pos = "top-left",
    showCompass = FALSE
  ) %>%
  add_fullscreen_control() %>%
  add_scale_control(
    unit = "nautical"
  )

if (interactive()) map

map <- mapboxer() %>%
  set_view_state(-74.5, 40, pitch = 35) %>%
  add_navigation_control(
    showCompass = FALSE,
    pos = "top-left"
  )

if (interactive()) map

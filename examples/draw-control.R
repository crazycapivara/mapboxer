mapboxer(
  center = c(9.5, 40.5),
  zoom = 7
) %>%
  add_navigation_control() %>%
  add_draw_control(
    displayControlsDefault = FALSE,
    controls = list(
      polygon = TRUE,
      trash = TRUE
    )
  )

mapboxer() %>%
  add_draw_control()

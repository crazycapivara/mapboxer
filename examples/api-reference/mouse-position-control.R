map <- mapboxer(zoom = 4) %>%
  add_mouse_position_control(
    mustache_template = "<b>Lng:</b>{{lng}}, <b>Lat:</b>{{lat}}",
    pos = "bottom-left"
  )

if (interactive()) map

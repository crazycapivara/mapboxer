layer_id <- "quakes"
popup_tpl <- "
  <b>Mag:</b> {{mag}}</br>
  <b>Stations:</b> {{stations}}</br>
  <b>Depth:</b> {{depth}}
"

map <- quakes %>%
  as_mapbox_source(lng = "long", lat = "lat") %>%
  mapboxer(center = c(176.9, -24.655), zoom = 4) %>%
  add_circle_layer(
    circle_color = "red",
    id = layer_id
  ) %>%
  add_popups(
    layer_id,
    popup = popup_tpl
  )

if (interactive()) map

uk_police_boundaries <- sf::st_transform(stats19::police_boundaries, 4326) %>%
  tibble::add_column(color = substr(rainbow(n = nrow(.)), 1, 7))

mapboxer(zoom = 5, center = c(-0.08391001, 51.68996)) %>%
  add_navigation_control() %>%
  add_fill_layer(
    source = as_mapbox_source(uk_police_boundaries),
    fill_color = list("get", "color"),
    fill_outline_color = "white",
    popup = "{{pfa16nm}}",
    fill_opacity = 0.4
  )

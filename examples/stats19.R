uk_police_boundaries <- sf::st_transform(stats19::police_boundaries, 4326) %>%
  tibble::add_column(color = substr(rainbow(n = nrow(.)), 1, 7))

bbox <- sf::st_bbox(uk_police_boundaries) %>% unname()
#bbox <- list(bbox[c(1, 2)], bbox[c(3, 4)])

mapboxer(
  #zoom = 5,
  #center = c(-0.08391001, 51.68996)
  bounds = bbox,
  fitBoundsOptions = list(padding = 20)
  ) %>%
  add_navigation_control() %>%
  add_fill_layer(
    source = as_mapbox_source(uk_police_boundaries),
    fill_color = list("get", "color"),
    fill_outline_color = "white",
    popup = "{{pfa16nm}}",
    fill_opacity = 0.4
  ) #%>% fit_bounds(bbox, padding = 100)

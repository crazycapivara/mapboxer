mapboxer() %>%
  add_source(
    geojsonsf::df_geojson(quakes, lon = "long", lat = "lat"),
    id = "quakes"
  )

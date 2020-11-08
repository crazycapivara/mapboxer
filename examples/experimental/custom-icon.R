devtools::load_all()

image_url <- "https://upload.wikimedia.org/wikipedia/commons/7/7c/201408_cat.png"

icon_style <- list(
  id = 'custom-icon',
  type = "symbol",
  source = as_mapbox_source(data.frame(lng = 0, lat = 0)),
  layout = list(
    "icon-image" = "cat",
    "icon-size" = 0.25
  )
)

mapboxer(
  #style = basemaps$Mapbox$outdoors_v11,
  element_id = "mapboxer"
) %>%
  add_image(image_url, "cat", style = icon_style) %>%
  add_layer(icon_style)

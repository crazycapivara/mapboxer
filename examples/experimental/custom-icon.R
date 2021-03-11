devtools::load_all()

image_url <- "https://upload.wikimedia.org/wikipedia/commons/7/7c/201408_cat.png"
image_url <- "http://icons.iconarchive.com/icons/jonathan-rey/simpsons/128/Lisa-Simpson-icon.png"
#image_url <- "https://upload.wikimedia.org/wikipedia/en/e/ec/Lisa_Simpson.png"
image_url <- "http://localhost:8000/Lisa-Simpson-icon.png"

icon_style <- list(
  id = 'custom-icon',
  type = "symbol",
  source = as_mapbox_source(us_states),#as_mapbox_source(data.frame(lng = 0, lat = 0)),
  layout = list(
    "icon-image" = "cat"
    ,"icon-size" = 0.5
  )
)

mapboxer(
  #style = basemaps$Mapbox$outdoors_v11,
  element_id = "mapboxer"
) %>%
  add_image(image_url, "cat", style = icon_style) #%>% add_layer(icon_style)

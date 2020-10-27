devtools::load_all()

LAYER_ID <- "crashes"

mvc <- sf::st_as_sf(motor_vehicle_collisions_nyc, coords = c("lng", "lat"))

# JS
#
# ["all",
#  [">", "injured", 1],
#  ["<", "injured", 3]
# ]

filter <- expr_all(
  expr_gt("injured", 1),
  expr_lt("injured", 3)
)

jsonlite::toJSON(filter, auto_unbox = TRUE) #%>% nchar()

as_mapbox_source(mvc) %>%
  mapboxer(bounds = sf::st_bbox(mvc)) %>%
  add_circle_layer(
    circle_color = "red"
    #,filter = filter
    , id = LAYER_ID
  ) %>%
  add_filter_control(LAYER_ID, cols = 45, filter = filter)

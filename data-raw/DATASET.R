## code to prepare `DATASET` dataset goes here

data_url <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/examples/geojson/vancouver-blocks.json"
vancouver_blocks <- sf::st_read(data_url)
saveRDS(vancouver_blocks, "data-raw/vancouver-blocks.rds")

#usethis::use_data("DATASET")

# https://opendata.cityofnewyork.us/

# Motor Vehicle Collisions - Crashes
motor_vehicle_collisions_url <- "https://data.cityofnewyork.us/resource/h9gi-nx95.json"
df_motor_vehicle_collisions <- jsonlite::fromJSON(motor_vehicle_collisions_url)

#path <- paste0(motor_vehicle_collisions_url, "?$limit=2000&$order=:id&$offset=0&$where=crash_date < '2020-09-25'") %>%
#  URLencode()
#path <- paste0(motor_vehicle_collisions_url, "?$where=crash_date >= '2019-04-01' and crash_date < '2019-06-01'") %>%
#  URLencode()

q <- list(
  "$limit" = 2000,
  "$order" = ":id",
  "$offset" = 0,
  "$where" = "crash_date < '2020-09-25'"
)

df_motor_vehicle_collisions <- httr::GET(motor_vehicle_collisions_url, query = q) %>%
  httr::content(as = "text") %>%
  jsonlite::fromJSON()

x <- tibble::as_tibble(df_motor_vehicle_collisions) %>%
  dplyr::mutate(
    date = as.Date(crash_date),
    lng = as.double(longitude),
    lat = as.double(latitude),
    injured = as.integer(number_of_persons_injured),
    killed = as.integer(number_of_persons_killed)
  ) %>%
  dplyr::select(date, time = crash_time, lng, lat, injured, killed) %>%
  na.omit()

as_mapbox_source(x[x$date > '2020-09-18', ]) %>%
  mapboxer(center = c(median(x$lng), median(x$lat)), zoom = 10) %>%
  add_circle_layer(circle_color = "red", popup = "{{date}} {{time}}") %>%
  add_filter_control("circle-layer", filter = list("==", "injured", 0), cols = 30, pos = "top-left")

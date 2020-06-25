## code to prepare `DATASET` dataset goes here

data_url <- "https://raw.githubusercontent.com/uber-common/deck.gl-data/master/examples/geojson/vancouver-blocks.json"
vancouver_blocks <- sf::st_read(data_url)
saveRDS(vancouver_blocks, "data-raw/vancouver-blocks.rds")

#usethis::use_data("DATASET")

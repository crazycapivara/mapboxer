# Changing the style of the map will clear all layers

library(mapboxer)
library(shiny)

view <- basicPage(
  h1("basemaps"),
  selectInput("basemap", "basemap",  names(basemaps$Carto)),
  mapboxerOutput("map")
)

backend <- function(input, output) {
  output$map <- renderMapboxer(
    as_mapbox_source(motor_vehicle_collisions_nyc) %>%
      mapboxer(
        center = c(-73.9165, 40.7114),
        zoom = 10
      ) %>%
      add_circle_layer(circle_color = "red")
  )
  observeEvent(input$basemap, {
    message(input$basemap)
    mapboxer_proxy("map") %>%
      set_map_style(basemaps$Carto[[input$basemap]]) %>%
      update_mapboxer()
  })
}

shinyApp(view, backend)

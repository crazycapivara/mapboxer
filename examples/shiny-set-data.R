library(shiny)
library(mapboxer)

view <- fluidPage(
  h1("mapboxer"),
  actionButton("sample", "sample"),
  mapboxerOutput("map")
)

server <- function(input, output) {
  output$map <- renderMapboxer({
    motor_vehicle_collisions_nyc %>%
      as_mapbox_source(lng = "lng", lat = "lat") %>%
      mapboxer(center = c(-73.9165, 40.7114), zoom = 10) %>%
      add_circle_layer(
        circle_color = "red",
        popup = "{{killed}}"
      )
  })

  observeEvent(input$sample, {
    mapboxer_proxy("map") %>%
      set_data(dplyr::sample_n(motor_vehicle_collisions_nyc, 100), lng = "lng", lat = "lat") %>%
      update_mapboxer()
  })
}

if (interactive()) shinyApp(view, server)

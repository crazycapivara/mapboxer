LAYER_ID <- "crashes"
START_VALUE <- 4

view <- basicPage(
  sliderInput("slider", "Number of persons injured",
              min = 0, max = 7, step = 1, value = START_VALUE),
  mapboxerOutput("map")
)

backend <- function(input, output) {
  output$map <- renderMapboxer({
    mapboxer(
      center = c(-73.9165, 40.7114),
      zoom = 9
    ) %>%
      add_circle_layer(
        source = as_mapbox_source(motor_vehicle_collisions_nyc),
        circle_color = "red",
        popup = "Number of persons injured: {{injured}}",
        filter = list("==", "injured", START_VALUE),
        id = LAYER_ID
      )
  })

  observeEvent(input$slider, {
    mapboxer_proxy("map") %>%
      set_filter(LAYER_ID, list("==", "injured", input$slider)) %>%
      update_mapboxer()
  })
}

if (interactive()) shinyApp(view, backend)

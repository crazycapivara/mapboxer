library(shiny)
library(mapboxer)

view <- basicPage(
  sliderInput("slider", "mag larger than:",
              min = 3, max = 6, step = 1, value = 4),
  mapboxerOutput("map")
)

backend <- function(input, output) {
  output$map <- renderMapboxer({
    mapboxer(center = c(176.9, -24.655), zoom = 4) %>%
      add_circle_layer(
        source = as_mapbox_source(quakes, lng = "long", lat = "lat"),
        circle_color = "red",
        popup = "{{mag}}",
        id = "quakes"
      )
  })

  observeEvent(input$slider, {
    mapboxer_proxy("map") %>%
      set_filter("quakes", list(">", "mag", input$slider)) %>%
      update_mapboxer()
  })
}

if (interactive()) shinyApp(view, backend)

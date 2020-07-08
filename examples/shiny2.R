library(shiny)
library(wesanderson)

layer_id <- "quakes"

view <- basicPage(
  h1("mapboxer"),
  selectInput("circle_color", "Circle Color", choices = wes_palettes$BottleRocket1),
  sliderInput("circle_radius", "Circle Radius", min = 1, max = 11, value = 5, step = 2),
  mapboxerOutput("map")
)

backend <- function(input, output) {
  output$map <- renderMapboxer({
    mapboxer(center = c(176.9, -24.655), zoom = 4) %>%
      add_circle_layer(
        source = as_mapbox_source(quakes, lng = "long", lat = "lat"),
        circle_color = wes_palettes$BottleRocket1[1],
        circle_radius = 5,
        id = layer_id
      )
  })

  observeEvent(c(input$circle_color, input$circle_radius), {
    # print(input$circle_color)
    mapboxer_proxy("map") %>%
      set_paint_property(layer_id, "circle_color", input$circle_color) %>%
      set_paint_property(layer_id, "circle_radius", input$circle_radius) %>%
      send_mapboxer_update()
  })
}

if (interactive()) shinyApp(view, backend)

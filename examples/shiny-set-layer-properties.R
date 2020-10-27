library(shiny)
library(wesanderson)

LAYER_ID <- "crashes"
START_IDX_CIRCLE_COLOR <- 2
START_CIRCLE_RADIUS <- 5


view <- basicPage(
  h1("mapboxer"),
  selectInput("circle_color", "Circle color",
              choices = wes_palettes$BottleRocket1, selected = START_IDX_CIRCLE_COLOR),
  sliderInput("circle_radius", "Circle radius",
              min = 1, max = 11, value = START_CIRCLE_RADIUS, step = 2),
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
        circle_color = wes_palettes$BottleRocket1[START_IDX_CIRCLE_COLOR],
        circle_radius = START_CIRCLE_RADIUS,
        id = LAYER_ID
      )
  })

  observeEvent(c(input$circle_color, input$circle_radius), {
    mapboxer_proxy("map") %>%
      set_paint_property(LAYER_ID, "circle_color", input$circle_color) %>%
      set_paint_property(LAYER_ID, "circle_radius", input$circle_radius) %>%
      update_mapboxer()
  })
}

if (interactive()) shinyApp(view, backend)

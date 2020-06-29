library(shiny)
library(mapboxer)

view <- fluidPage(
  h1("mapboxer"),
  sliderInput("slider", "mag larger than:", min = 1, max = 6, step = 1, value = 4),
  # actionButton("go", "go"),
  mapboxerOutput("map")
)

server <- function(input, output) {
  output$map <- renderMapboxer({
    quakes %>%
      as_mapbox_source(lng = "long", lat = "lat") %>%
      mapboxer(center = c(176.9, -24.655), zoom = 4, style = use_background_style()) %>%
      add_circle_layer(circle_color = "red", popup = "{{mag}}", id = "quakes")
  })

  observeEvent(input$slider, {
    mapboxer_proxy("map") %>%
      set_filter("quakes", list(">", "mag", input$slider)) %>%
      send_update(hi = "folks")
  })
}

if (interactive()) shinyApp(view, server)

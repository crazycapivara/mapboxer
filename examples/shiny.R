library(shiny)
library(mapboxer)

view <- fluidPage(
  h1("mapboxer"),
  actionButton("go", "go"),
  mapboxerOutput("map")
)

server <- function(input, output) {
  output$map <- renderMapboxer({
    quakes %>%
      as_mapbox_source(lng = "long", lat = "lat") %>%
      mapboxer(center = c(176.9, -24.655), zoom = 4) %>%
      add_circle_layer(circle_color = "red", popup = "{{mag}}")
  })

  observeEvent(input$go, {
    message("go")
    mapboxer_proxy("map") %>%
      add_marker(176.9, -24.655) %>%
      send_update(hi = "folks")
  })
}

if (interactive()) shinyApp(view, server)

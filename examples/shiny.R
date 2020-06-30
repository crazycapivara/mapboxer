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
      add_circle_layer(circle_color = "red", popup = "{{mag}}", id = "quakes") %>%
      add_mouse_position_control("Lng: {{lng}}, Lat: {{lat}}")
  })

  observeEvent(input$slider, {
    row <- quakes[sample(1:nrow(quakes), 1), ]
    mapboxer_proxy("map") %>%
      set_paint_property("quakes", "circle_radius", input$slider) %>%
      set_filter("quakes", list(">", "mag", input$slider)) %>%
      # add_marker(row$long, row$lat) %>%
      send_update(hi = "folks")
  })
}

if (interactive()) shinyApp(view, server)

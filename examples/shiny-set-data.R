library(shiny)
library(mapboxer)

view <- fluidPage(
  h1("mapboxer"),
  actionButton("sample", "sample"),
  mapboxerOutput("map")
)

server <- function(input, output) {
  output$map <- renderMapboxer({
    quakes %>%
      as_mapbox_source(lng = "long", lat = "lat") %>%
      mapboxer(center = c(176.9, -24.655), zoom = 4) %>%
      add_circle_layer(
        circle_color = "red",
        popup = "{{mag}}"
      )
  })

  observeEvent(input$sample, {
    mapboxer_proxy("map") %>%
      set_data(dplyr::sample_n(quakes, 100), lng = "long", lat = "lat") %>%
      update_mapboxer()
  })
}

if (interactive()) shinyApp(view, server)

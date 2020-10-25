library(shiny)
library(mapboxer)

view <- fluidPage(
  h1("mapboxer"),
  mapboxerOutput("map"),
  textOutput("feature")
)

server <- function(input, output) {
  output$map <- renderMapboxer({
    mapboxer(center = c(144.9624, -37.8105), zoom = 10) %>%
      add_fill_layer(
        source = as_mapbox_source(geojsonsf::geo_melbourne),
        fill_color = c("get", "fillColor")
      )
  })

  observeEvent(input$map_onclick, {
    print(input$map_onclick)
  })

  output$feature <- renderText({
    whisker::whisker.render("{{coords.lng}} {{coords.lat}}, {{layer_id}}, {{props.AREASQKM}}", input$map_onclick)
  })
}

if (interactive()) shinyApp(view, server)

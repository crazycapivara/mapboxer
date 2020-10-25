library(shiny)
library(mapboxer)

view <- fluidPage(
  h1("mapboxer"),
  mapboxerOutput("map"),
  htmlOutput("feature")
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
    info <- input$map_onclick
    if (is.null(info)) return("<p>Click on a feature to show its details.</p>")

    whisker::whisker.render(
      "<p>{{coords.lng}}, {{coords.lat}}</p>
       <p><b>Layer Id:</b> {{layer_id}}, <b>Area:</b> {{props.AREASQKM}} km<sup>2</sup></p>", info)
  })
}

if (interactive()) shinyApp(view, server)

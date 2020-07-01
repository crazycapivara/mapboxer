library(shiny)
library(mapboxer)

view <- fluidPage(
  h1("mapboxer"),
  sliderInput("slider", "mag larger than:", min = 1, max = 6, step = 1, value = 4),
  actionButton("go", "hide layer"),
  mapboxerOutput("map")
)

server <- function(input, output) {
  output$map <- renderMapboxer({
    quakes %>%
      as_mapbox_source(lng = "long", lat = "lat") %>%
      mapboxer(center = c(176.9, -24.655), zoom = 4, style = use_background_style()) %>%
      add_circle_layer(circle_color = "red", popup = "{{mag}}", id = "quakes") %>%
      add_mouse_position_control("Lng: {{lng}}, Lat: {{lat}}") %>%
      add_navigation_control(pos = "top-left")
  })

  observeEvent(input$slider, {
    #row <- quakes[sample(1:nrow(quakes), 1), ]
    #data <- geojsonsf::df_geojson(dplyr::sample_n(quakes, 100), lon = "long", lat = "lat")
    data <- as_mapbox_source(dplyr::sample_n(quakes, 100), lng = "long", lat = "lat")
    # data <- "https://docs.mapbox.com/mapbox-gl-js/assets/earthquakes.geojson"
    mapboxer_proxy("map") %>%
      set_paint_property("quakes", "circle_radius", input$slider) %>%
      set_data(data) %>%
      #set_filter("quakes", list(">", "mag", input$slider)) %>%
      # add_marker(row$long, row$lat) %>%
      send_update(hi = "folks")
  })

  observeEvent(input$go, {
    mapboxer_proxy("map") %>%
      set_layout_property("quakes", "visibility", FALSE) %>%
      send_update()
  })
}

if (interactive()) shinyApp(view, server)

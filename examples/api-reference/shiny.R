library(shiny)
library(mapboxer)

LAYER_ID <- "mvc"

view <- basicPage(
  h1("mapboxer"),
  sliderInput(
    "slider",
    "Number of persons injured",
    min = 0,
    max = max(motor_vehicle_collisions_nyc$injured),
    step = 1,
    value = 0
  ),
  checkboxInput("hide", "Hide layer"),
  mapboxerOutput("map"),
  htmlOutput("datetime")
)

server <- function(input, output) {
  output$map <- renderMapboxer({
      as_mapbox_source(motor_vehicle_collisions_nyc) %>%
      mapboxer(
        center = c(-73.9165, 40.7114),
        zoom = 10,
        style = basemap_raster_style(stamen_raster_tiles())
      ) %>%
      add_circle_layer(
        circle_color = "black",
        popup = "Number of persons injured {{injured}}",
        id = LAYER_ID
      ) %>%
      add_mouse_position_control(
        "Lng: {{lng}}</br>Lat: {{lat}}",
        css_text = "text-align: left; width: 180px;"
      ) %>%
      add_navigation_control(pos = "top-left")
  })

  observeEvent(input$slider, {
    mapboxer_proxy("map") %>%
      set_filter(LAYER_ID, list("==", "injured", input$slider)) %>%
      update_mapboxer()
  })

  observeEvent(input$hide, {
    mapboxer_proxy("map") %>%
      set_layout_property(LAYER_ID, "visibility", !input$hide) %>%
      update_mapboxer()
  })

  output$datetime <- renderText({
    props <- input$map_onclick$props
    sprintf("<p>%s %s</p>", props$date, props$time)
  })
}

if (interactive()) shinyApp(view, server)

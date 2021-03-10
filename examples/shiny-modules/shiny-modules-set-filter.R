library(shiny)

devtools::load_all()

LAYER_ID <- "crashes"
START_VALUE <- 4

mod_map_view <- function(id) {
  ns <- NS(id)
  tagList(
    sliderInput(
      ns("slider"), "Number of persons injured",
      min = 0, max = 7, step = 1, value = START_VALUE
    ),
    mapboxerOutput(ns("map"))
  )
}

mod_map_server <- function(id) {
  # ns <- NS(id)
  moduleServer(id, function(input, output, session) {
    output$map <- renderMapboxer({
      mapboxer(
        center = c(-73.9165, 40.7114),
        zoom = 9
      ) %>%
        add_circle_layer(
          source = as_mapbox_source(motor_vehicle_collisions_nyc),
          circle_color = "red",
          popup = "Number of persons injured: {{injured}}",
          filter = list("==", "injured", START_VALUE),
          id = LAYER_ID
        )
    })

    observeEvent(input$slider, {
      # mapboxer_proxy(ns("map")) %>%
      mapboxer_proxy("map") %>%
        set_filter(LAYER_ID, list("==", "injured", input$slider)) %>%
        update_mapboxer()
    })
  })
}

view <- basicPage(
  mod_map_view("map1")
)

server <- function(input, output, session) {
  mod_map_server("map1")
}

if (interactive()) shinyApp(view, server)

library(shiny)
library(dplyr)

WORLD <- spData::world
CHOICES <- unique(WORLD$continent)
SOURCE_ID <- "world"

set_color <- function(world, .continent = CHOICES[1]) {
  world %>%
    filter(continent == .continent) %>%
    mutate(color = scales::col_quantile("Greys", pop)(pop))
}

frontend <- basicPage(
  selectInput("continent","Select continent", choices = CHOICES),
  mapboxerOutput("map")
)

backend <- function(input, output, session) {
  output$map <- renderMapboxer({
    world_selection <- WORLD %>%
      set_color()
    mapboxer(bounds = sf::st_bbox(world_selection)) %>%
      add_source(as_mapbox_source(world_selection), SOURCE_ID) %>%
      add_fill_layer(
        fill_color = c("get", "color"),
        source = SOURCE_ID,
        popup = "{{name_long}}: {{pop}}"
      )
  })

  observeEvent(input$continent, {
    world_selection <- WORLD %>%
      set_color(input$continent)
    # print(world_selection)
    mapboxer_proxy("map") %>%
      set_data(world_selection, SOURCE_ID) %>%
      fit_bounds(sf::st_bbox(world_selection)) %>%
      update_mapboxer()
  })
}

shinyApp(frontend, backend)

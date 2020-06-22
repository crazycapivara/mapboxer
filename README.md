
<!-- README.md is generated from README.Rmd. Please edit that file -->
mapboxer
========

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/mapboxer)](https://CRAN.R-project.org/package=mapboxer) <!-- badges: end -->

The **mapboxer** package makes [Mapbox GL JS](https://docs.mapbox.com/mapbox-gl-js/api/), an open source JavaScript library that uses WebGL to render interactive maps, available within R via the [htmlwidgets](https://www.htmlwidgets.org/) package.

Installation
------------

Install the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("crazycapivara/mapboxer")
```

Quickstart
----------

``` r
library(mapboxer)

fill_style <- list(
  id = "melbourne",
  type = "fill",
  paint = list(
    "fill-color" = c("get", "fillColor"),
    "fill-opacity" = 0.7
  )
)

geojsonsf::geo_melbourne %>%
  as_mapbox_source() %>%
  mapboxer() %>%
  set_view_state(lng =  144.9624, lat = -37.8105, zoom = 10, pitch = 35) %>%
  add_layer(fill_style, popup = "Area: {{AREASQKM}} km<sup>2</sup>")
```

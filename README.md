
<!-- README.md is generated from README.Rmd. Please edit that file -->
mapboxer
========

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/mapboxer)](https://CRAN.R-project.org/package=mapboxer) [![Travis-CI Build Status](https://travis-ci.org/crazycapivara/mapboxer.svg?branch=master)](https://travis-ci.org/crazycapivara/mapboxer) [![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active) <!-- badges: end -->

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

map <- geojsonsf::geo_melbourne %>%
  as_mapbox_source() %>%
  mapboxer() %>%
  set_view_state(
    lng =  144.9624,
    lat = -37.8105,
    zoom = 10,
    pitch = 35
  ) %>%
  add_fill_layer(
    fill_color = c("get", "fillColor"),
    fill_opacity = 0.6,
    popup = "Area: {{AREASQKM}} km<sup>2</sup>"
  )

if (interactive()) map
```

Documentation
-------------

The package is still in an early stage, so the documention is work in progress.

[mapboxer-docs](https://crazycapivara.github.io/mapboxer/)

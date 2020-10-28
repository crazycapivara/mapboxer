# mapboxer 0.4.0

* Renamed `send_mapboxer_update()` to `update_mapboxer()` (#32)
* Send data back to R in Shiny app (#44)
* Support for tooltips (#43)
* Added constant with basemap style URLs, add `basemap_` prefix to funcs creating basemap styles (#41, #27)
* Updated examles (#39)
* Change basemap in Shiny apps (#24)
* Add `draw` plugin as experimental feature, in this case js library for the feature is loaded externally (#17)
* Added `motor_vehicle_collisions_nyc` sample dataset (#3)
* Added `row` and `col` parameter to `add_filter_control` (#33)
* Support `sf` bounding boxes for `bounds` parameter in `mapboxer()` and `fit_bounds()`

# mapboxer 0.3.2

* Added _Getting started_ vignette.
* Renamed `send_update()` to `send_mapboxer_update()`.
* Added support for data frames and `sf`-objects in `set_data()`.

# mapboxer 0.3.1

* Added support for `mapbox_source` objects as `data` parameter in `set_data()`.

# mapboxer 0.3.0

* Added `mapboxer_proxy()` to update map in Shiny apps:
    - `set_filter()`
    - `set_paint_property()`
    - `set_layout_property()`
    - `set_data()`

# mapboxer 0.2.0

* Added custom controls:
    - `add_text_control()`: Add text boxes to the map
    - `add_mouse_position_control()` Show coordinates on `mouseover`
    - `add_filter_control()`: Filter layer data on the fly

# mapboxer 0.1.2

* Added layer shortcuts beside the generic `add_layer()` func:
    - `add_fill_layer()`
    - `add_circle_layer()`
    - `add_line_Layer()`

# mapboxer 0.1.1

* Added funcs to use raster tiles or a single background color as map style:
    - `use_raster_style()`
    - `use_stamen_raster_style()`
    - `get_osm_raster_tiles()`

# mapboxer 0.1.0

* Added a `NEWS.md` file to track changes to the package.

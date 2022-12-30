import points from "./test/data/bart-stations.json";
import mapboxerWidget from "./widget";
import style from "./test/circle-layer";

global.HTMLWidgets = { };

const widgetData = {
  calls: [
    {
      methodName: "addControl",
      args: {
        controlName: "NavigationControl",
        topLevel: "mapboxgl",
        pos: "top-left",
        options: {
          showCompass: false
        }
      }
    },
    {
      methodName: "addControl",
      args: {
        controlName: "ScaleControl",
        topLevel: "mapboxgl",
        pos: "bottom-right"
      }
    },
    {
      methodName: "addSource",
      args: {
        id: "points",
        source: {
          type: "geojson",
          data: points
        }
      }
    },
    {
      methodName: "addLayer",
      args: {
        style: style
      }
    },
    {
      methodName: "addPopups",
      args: { layer: "circles", popup: "Name: {{name}}" }
    },
    {
      methodName: "addMarker",
      args: { lng: -122.45, lat: 37.8, popup: "Hi there!" }
    },
    {
      methodName: "addCustomControl",
      args: {
        controlName: "TextControl",
        pos: "top-left",
        options: {
          cssText: "background: yellow; padding: 5px;",
          text: "Circle Layer"
        }
      }
    },
    {
      methodName: "addCustomControl",
      args: {
        controlName: "MousePositionControl",
        pos: "bottom-left",
        options: { mustacheTemplate: "<b>Lng:</b> {{lng}}, <b>Lat:</b> {{lat}}", cssText: "text-align: left;" }
      }
    },
    {
      methodName: "addCustomControl",
      args: {
        controlName: "FilterControl",
        options: {
          layer: "circles",
          filter: [">", "exits", 8000],
          textareaAttributes: { rows: 1, cols: 20 }
        }
      }
    },
    {
      methodName: "fitBounds",
      args: {
        bounds: [
          [ -122.36030693054174, 37.83390198998819 ],
          [ -122.53969306945785, 37.76608244285002 ]
        ]
      }
    },
    {
      methodName: "setPaintProperty",
      args: { layer: "circles", property: "circle-color", value: "pink" }
    }/*,
    {
      methodName: "setData",
      args: { source: "points", data: 'https://docs.mapbox.com/mapbox-gl-js/assets/earthquakes.geojson' }
    }*/
    /*,
    {
      methodName: "setFilter",
      args: { layer: "circles", filter: ["==", "code", "LF"] }
    }
    */
  ],
  mapProps: {
    center: [ -122.45, 37.8 ],
    zoom: 9,
    style: "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json"
  }
};

const widgetElement = document.getElementById("widget");
const widget = mapboxerWidget(widgetElement);
widget.renderValue(widgetData);

global.debug = {
  mapboxerWidget,
  points
};

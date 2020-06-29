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
        options: { layer: "circles", filter: [">", "exits", 8000] }
      }
    },
    {
      methodName: "setFilter",
      args: { layer: "circles", filter: ["==", "code", "LF"] }
    }
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

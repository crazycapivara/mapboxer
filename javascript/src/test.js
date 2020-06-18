import mapboxerWidget from "./widget";

global.mapboxer = mapboxerWidget;
global.HTMLWidgets = { };

const widgetData = {
  calls: [
    {
      methodName: "addNavigationControl",
      args: {
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
    }
  ],
  mapProps: {
    center: [ -74.5, 40 ],
    zoom: 9,
    style: "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json"
  }
};

const widgetElement = document.getElementById("widget");
const widget = mapboxerWidget(widgetElement);
widget.renderValue(widgetData);

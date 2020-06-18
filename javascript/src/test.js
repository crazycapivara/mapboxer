import mapboxerWidget from "./widget";
global.HTMLWidgets = { };

const widgetData = {
  message: "mapboxer"
};

const widgetElement = document.getElementById("widget");
const widget = mapboxerWidget(widgetElement);
widget.renderValue(widgetData);

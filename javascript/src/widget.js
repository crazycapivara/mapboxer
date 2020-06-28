import "../styles/mapboxer.css";

import methods from "./methods";
import { DEFAULT_SOURCE } from "./constants";

const mapboxer = global.mapboxer = {
  methods,
  _widget: { }
};

export default function(widgetElement, width, height) {
  let map = null;
  const _widget = mapboxer._widget[widgetElement.id] = { };

  function renderValue(widgetData) {
    console.log("mapboxgl", mapboxgl.version);
    console.log(widgetData);
    const mapStyle = widgetData.mapProps.style;

    // The background layer needs an empty sources object.
    if (typeof mapStyle === "object") {
      mapStyle.sources = mapStyle.sources || { };

      // The 'tiles' property needs to be an array.
      Object.values(mapStyle.sources).forEach(source => {
        if (source.hasOwnProperty("tiles") & !Array.isArray(source.tiles)) {
          source.tiles = Array(source.tiles);
        }
      })
    }

    mapboxgl.accessToken = widgetData.accessToken || null;
    widgetData.mapProps.container = widgetElement.id;
    map = _widget.map = new mapboxgl.Map(widgetData.mapProps);
    map.on("error", (e) => { throw e.error; });
    if (widgetData.source) {
      methods.addSource.call(map, { id: DEFAULT_SOURCE, source: widgetData.source });
    }

    widgetData.calls.forEach(({ methodName, args }) => methods[methodName].call(map, args));
  }

  function resize(width, height) {
    // not implemented yet
  }

  return { renderValue, resize };
}

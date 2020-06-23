import methods from "./methods";
import { DEFAULT_SOURCE } from "./constants";

global.mapboxer = {
  methods
};

export default function(widgetElement, width, height) {
  let map = null;

  function renderValue(widgetData) {
    console.log(mapboxgl.version);
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

    widgetData.mapProps.container = widgetElement.id;
    map = global.mapboxer.map = new mapboxgl.Map(widgetData.mapProps);
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

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
    mapStyle.sources = mapStyle.sources || { };
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

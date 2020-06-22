import methods from "./methods";

global.mapboxer = {
  methods
};

export default function(widgetElement, width, height) {
  let map = null;

  function renderValue(widgetData) {
    console.log(mapboxgl.version);
    console.log(widgetData);

    widgetData.mapProps.container = widgetElement.id;
    map = global.mapboxer.map = new mapboxgl.Map(widgetData.mapProps);
    if (widgetData.source) {
      methods.addSource.call(map, { id: "mapboxer", source: widgetData.source });
    }

    widgetData.calls.forEach(({ methodName, args }) => methods[methodName].call(map, args));
  }

  function resize(width, height) {
    // not implemented yet
  }

  return { renderValue, resize };
}

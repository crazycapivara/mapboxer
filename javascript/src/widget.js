export default function(widgetElement, width, height) {
  let map = null;

  function renderValue(widgetData) {
    console.log(mapboxgl.version);
    console.log(widgetData);

    widgetData.mapProps.container = widgetElement.id;
    map = new mapboxgl.Map(widgetData.mapProps);
  }

  function resize(width, height) {
    // not implemented yet
  }

  return { renderValue, resize, map };
}

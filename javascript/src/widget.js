export default function(widgetElement, width, height) {
  let map = null;

  function renderValue(widgetData) {
    console.log(mapboxgl.version);
    console.log(widgetData);

    widgetElement.innerText = widgetData.message;
  }

  function resize(width, height) {
    // not implemented yet
  }

  return { renderValue, resize };
}

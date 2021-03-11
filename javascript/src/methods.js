import { render } from "mustache";
import * as customControls from "./custom-controls";
import { DEFAULT_SOURCE } from "./constants";

function addControl(args) {
  const map = this;
  const control = new mapboxgl[args.controlName](args.options);
  map.addControl(control, args.pos);
}

function addSource(args) {
  const map = this;
  map.addSource(args.id, args.source);
}

function addLayer(args) {
  const map = this;
  args.style.source = args.style.source || DEFAULT_SOURCE;
  map.addLayer(args.style);

  const layerId = args.style.id;
  map.on("mouseenter", layerId, () => map.getCanvas().style.cursor = "pointer");
  map.on("mouseleave", layerId, () => map.getCanvas().style.cursor = "");

  // Pass data back to R in 'shinyMode'
  if (HTMLWidgets.shinyMode) {
    map.on("click", args.style.id, (e) => {
      const widgetId = map.getContainer().id;
      const feature = e.features[0];
      const data = {
        coords: e.lngLat,
        props: feature.properties,
        layer_id: feature.layer.id,
        widget_id: widgetId
      };
      console.log(data);
      Shiny.onInputChange(widgetId + "_onclick", data);
    });
  }
}

function addPopups(args) {
  const map = this;
  const layerId = args.layerId;
  map.on("click", layerId, (e) => {
    const lngLat = Object.values(e.lngLat);
    const feature = e.features[0];
    const content = render(args.template, feature.properties);
    new mapboxgl.Popup(args.options || { })
      .setLngLat(lngLat)
      .setHTML(content)
      .addTo(map);
  });
  //map.on("mouseenter", layerId, () => map.getCanvas().style.cursor = "pointer");
  //map.on("mouseleave", layerId, () => map.getCanvas().style.cursor = "");
}

function addTooltips(args) {
  const map = this;
  const layerId = args.layerId;
  const popup = new mapboxgl.Popup({
    closeButton: false,
    closeOnClick: false
  });
  map.on("mousemove", layerId, (e) => {
    //map.getCanvas().style.cursor = "pointer";
    const lngLat = Object.values(e.lngLat);
    const feature = e.features[0];
    const content = render(args.template, feature.properties);
    popup.setLngLat(lngLat)
      .setHTML(content)
      .addTo(map);
  });
  map.on("mouseleave", layerId, () => {
    //map.getCanvas().style.cursor = "";
    popup.remove();
  });
}

function addMarker(args) {
  const map = this;
  const marker = new mapboxgl.Marker()
    .setLngLat([args.lng, args.lat]);
  const element = marker.getElement();
  element.style.cursor = "pointer";
  if (args.popup) {
    marker.setPopup(new mapboxgl.Popup().setHTML(args.popup));
  }

  marker.addTo(map);
}

function addImage({id, url, style}) {
  const map = this;
  map.loadImage(url, (error, image) => {
    if (error) throw error;

    map.addImage(id, image);
    map.addLayer(style);
  });
}

function addCustomControl(args) {
  const map = this;
  const control = new customControls[args.controlName](args.options);
  map.addControl(control, args.pos);
}

function setFilter(args) {
  const map = this;
  map.setFilter(args.layerId, args.filter);
}

function setPaintProperty(args) {
  const map = this;
  map.setPaintProperty(args.layer, args.property, args.value);
}

function setLayoutProperty(args) {
  const map = this;
  map.setLayoutProperty(args.layer, args.property, args.value);
}

function setData(args) {
  const map = this;
  const source = args.source || DEFAULT_SOURCE;
  map.getSource(source).setData(args.data);
}

function fitBounds(args) {
  const map = this;
  map.fitBounds(args.bounds, args.options || { });
}

function setStyle(args) {
  const map = this;
  map.setStyle(args.style);
}

// Plugins
function addDrawControl(args) {
  const map = this;
  const draw = new MapboxDraw(args.options);
  map.addControl(draw, args.pos);
  if (args.data) draw.add(args.data);
  map.on("draw.create", e => {
    console.log(e.features);
    console.log(draw.getAll());
  });
}

// Experimental
const EXPRESSION_IDENTIFIER = "@=";

function addDeckLayer(args) {
  const map = this;
  console.log("deck.gl", deck.version);
  args.props.type = deck[args.type];

  // Add popup
  if (args.popup) {
    const popup = new mapboxgl.Popup({
      closeOnClick: false
    });

    args.props.pickable = true;
    args.props.onClick = ({object, lngLat}) => {
      console.log(object);
      console.log(lngLat);

      popup.setLngLat(lngLat)
        .setHTML(render(args.popup, object))
        .addTo(map);
    };
  }

  if (typeof args.props.data === "object") {
    args.props.data = HTMLWidgets.dataframeToD3(args.props.data); // allow urls
  }

  // Convert mapboxer expressions
  const convertedProps = { };
  for (let key in args.props) {
    const value = args.props[key];
    if (isMapboxerExpression(value)) {
      console.log(value);
      convertedProps[key] = (data) => JSON.parse(render(value.replace(EXPRESSION_IDENTIFIER, ""), data));
    }
  }

  Object.assign(args.props, convertedProps);
  console.log(args.props);
  const layer = new deck.MapboxLayer(args.props);
  map.addLayer(layer);
}

function isMapboxerExpression(value) {
  return typeof value === "string" && value.startsWith(EXPRESSION_IDENTIFIER);
}

export default {
  addControl,
  addSource,
  addLayer,
  addPopups,
  addTooltips,
  addMarker,
  addCustomControl,
  customControls,
  setFilter,
  setPaintProperty,
  setLayoutProperty,
  setData,
  fitBounds,
  setStyle,
  addDrawControl,
  addDeckLayer,
  addImage
};

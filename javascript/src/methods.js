import { render } from "mustache";
// import customControls from "./custom-controls";
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
  // map.on("load", () => map.addSource(args.id, args.source));
}

function addLayer(args) {
  const map = this;
  args.style.source = args.style.source || DEFAULT_SOURCE;
  map.addLayer(args.style);
  // map.on("load", () => map.addLayer(args.style));
}

function addPopups(args) {
  const map = this;
  const layer = args.layer;
    map.on("click", layer, (e) => {
      const lngLat = Object.values(e.lngLat);
      const feature = e.features[0];
      const content = render(args.popup, feature.properties);
      new mapboxgl.Popup()
        .setLngLat(lngLat)
        .setHTML(content)
        .addTo(map);
    });
    map.on("mouseenter", layer, () => map.getCanvas().style.cursor = "pointer");
    map.on("mouseleave", layer, () => map.getCanvas().style.cursor = "");
  /*
  map.on("load", () => {
    const layer = args.layer;
    map.on("click", layer, (e) => {
      const lngLat = Object.values(e.lngLat);
      const feature = e.features[0];
      const content = render(args.popup, feature.properties);
      new mapboxgl.Popup()
        .setLngLat(lngLat)
        .setHTML(content)
        .addTo(map);
    });
    map.on("mouseenter", layer, () => map.getCanvas().style.cursor = "pointer");
    map.on("mouseleave", layer, () => map.getCanvas().style.cursor = "");
  });
  */
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
  // map.on("load", () => marker.addTo(map));
}

function addCustomControl(args) {
  const map = this;
  const control = new customControls[args.controlName](args.options);
  map.addControl(control, args.pos);
}

function setFilter(args) {
  const map = this;
  map.setFilter(args.layer, args.filter);
  /*
  if (map.loaded()) {
    map.setFilter(args.layer, args.filter);
  } else {
    map.on("load", () => map.setFilter(args.layer, args.filter));
  }
  */
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

export default {
  addControl,
  addSource,
  addLayer,
  addPopups,
  addMarker,
  addCustomControl,
  customControls,
  setFilter,
  setPaintProperty,
  setLayoutProperty,
  setData,
  fitBounds,
  addDrawControl
};

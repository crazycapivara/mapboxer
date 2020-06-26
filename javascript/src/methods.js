import { render } from "mustache";
import { DEFAULT_SOURCE } from "./constants";

function addControl(props) {
  const map = this;
  const control = new mapboxgl[props.controlName](props.options);
  map.addControl(control, props.pos);
}

function addSource(props) {
  const map = this;
  map.on("load", () => map.addSource(props.id, props.source));
}

function addLayer(args) {
  const map = this;
  args.style.source = args.style.source || DEFAULT_SOURCE;
  map.on("load", () => map.addLayer(args.style));
}

// TODO: Rename to addPopups
function addPopup(args) {
  const map = this;
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

  map.on("load", () => marker.addTo(map));
}

export default {
  addControl,
  addSource,
  addLayer,
  addPopup,
  addMarker
};

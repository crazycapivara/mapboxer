import { render } from "mustache";

function addControl(props) {
  const map = this;
  const control = new mapboxgl[props.controlName](props.options);
  map.addControl(control, props.pos);
}

function addSource(props) {
  const map = this;
  map.on("load", () => map.addSource(props.id, props.source));
}

function addLayer(props) {
  const map = this;
  map.on("load", () => map.addLayer(props.style));
}

function addPopup(args) {
  const map = this;
  map.on("load", () => {
    const layer = args.layer;
    map.on("click", layer, (e) => {
      const lngLat = Object.values(e.lngLat);
      const feature = e.features[0];
      // props.textField?
      // const content = feature.properties[args.text];
      const content = render(args.popup, feature.properties);
      // console.log(feature);

      new mapboxgl.Popup()
        .setLngLat(lngLat)
        .setHTML(content)
        .addTo(map);
    });

    map.on("mouseenter", layer, () => map.getCanvas().style.cursor = "pointer");

    map.on("mouseleave", layer, () => map.getCanvas().style.cursor = "");
  });
}

export default {
  addControl,
  addSource,
  addLayer,
  addPopup
};

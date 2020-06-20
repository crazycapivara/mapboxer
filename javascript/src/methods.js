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

function addPopup(props) {
  const map = this;
  map.on("load", () => {
    map.on("click", props.layer, (e) => {
      const lngLat = Object.values(e.lngLat);
      const feature = e.features[0];
      const content = feature.properties[props.prop];
      // console.log(feature);

      new mapboxgl.Popup()
        .setLngLat(lngLat)
        .setHTML(content)
        .addTo(map);
    });

    map.on("mouseenter", props.layer, () => map.getCanvas().style.cursor = "pointer");

    map.on("mouseleave", props.layer, () => map.getCanvas().style.cursor = "");
  });
}

export default {
  addControl,
  addSource,
  addLayer,
  addPopup
};

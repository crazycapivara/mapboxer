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

export default {
  addControl,
  addSource,
  addLayer
};

function addControl(props) {
  const map = this;
  const control = new mapboxgl[props.controlName](props.options);
  map.addControl(control, props.pos);
}

function addSource(props) {
  const map = this;
  const source = {
    type: "geojson",
    data: props.data
  };
  map.on("load", () => map.addSource(props.id, source));
}

export default {
  addControl,
  addSource
};

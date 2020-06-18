function addControl(props) {
  const map = this;
  const control = new mapboxgl[props.controlName](props.options);
  map.addControl(control, props.pos);
}

function addNavigationControl(props) {
  const map = this;
  map.addControl(new mapboxgl.NavigationControl(props.options), props.pos);
}

export default {
  addControl,
  addNavigationControl
};

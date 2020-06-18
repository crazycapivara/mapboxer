function addNavigationControl(props) {
  const map = this;
  map.addControl(new mapboxgl.NavigationControl(props.options), props.pos);
}

export default {
  addNavigationControl
};

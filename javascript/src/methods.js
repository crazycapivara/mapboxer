function addNavigationControl(props) {
  const map = this;
  map.addControl(new mapboxgl.NavigationControl(props));
}

export default {
  addNavigationControl
};

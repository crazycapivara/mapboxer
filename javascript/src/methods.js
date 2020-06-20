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
      // console.log(lngLat, feature);

      new mapboxgl.Popup()
        .setLngLat(lngLat)
        .setHTML("description")
        .addTo(map);
    });

    // Change the cursor to a pointer when the mouse is over the layer.
    map.on('mouseenter', props.layer, function() {
      map.getCanvas().style.cursor = "pointer";
    });

    // Change it back to a pointer when it leaves.
    map.on('mouseleave', props.layer, function() {
      map.getCanvas().style.cursor = "";
    });
  });
}

export default {
  addControl,
  addSource,
  addLayer,
  addPopup
};

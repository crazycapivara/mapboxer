export default class XYZControl {
  constructor(options) {
    this._options = options || { };
  }

  onAdd(map) {
    this._map = map;
    this._container = document.createElement("div");
    this._container.classList.add("mapboxgl-ctrl", "mapboxer-text-ctrl");
    this._container.style.cssText = this._options.cssText || "";
    //this._container.innerHTML = "Control Panel";

    // Create slider
    console.log("slider", this._options);
    /*
    const slider = document.createElement("input");
    slider.type = "range";
    Object.assign(slider, this._options[0]);
    slider.onchange = (e) => console.log(slider.value, e.target.value);
    */
    const slider = this._createSlider(this._options[0]);
    this._container.append(slider);

    return this._container;
  }

  onRemove() {
    this._container.parentNode.removeChild(this._container);
    this._map = undefined;
  }

  _createSlider({props, filter}) {
    const container = document.createElement("div");
    container.classList.add("mapboxer-slider-ctrl");
    const label = document.createElement("label");
    const slider = document.createElement("input");
    slider.type = "range";
    Object.assign(slider, props);

    slider.onchange = (e) => {
      label.innerHTML = e.target.value;
      const expression = [ filter.operator, filter.property, parseInt(e.target.value) ];
      console.log(expression);
      this._map.setFilter(filter.layerId, expression);
    };

    label.innerHTML = slider.value;
    this._map.setFilter(filter.layerId, [ filter.operator, filter.property, props.value ]);
    container.append(label, slider);
    return container;
  }
}


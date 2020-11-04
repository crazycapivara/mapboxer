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
    console.log("control panel", this._options);
    this._options.forEach(item => {
      if(item.type === "Slider") this._addSlider(item);
    });
    return this._container;
  }

  onRemove() {
    this._container.parentNode.removeChild(this._container);
    this._map = undefined;
  }

  _addSlider({props, filter}) {
    const container = document.createElement("div");
    container.classList.add("mapboxer-slider-ctrl");
    const label = document.createElement("label");
    const slider = document.createElement("input");
    slider.type = "range";
    Object.assign(slider, props);
    const setLabel = (value) => {
      label.innerHTML = [filter.property, filter.operator, value].join(" ");
    };
    slider.onchange = (e) => {
      //label.innerHTML = e.target.value;
      setLabel(e.target.value);
      const expression = [ filter.operator, filter.property, parseInt(e.target.value) ];
      console.log(expression);
      this._map.setFilter(filter.layerId, expression);
    };

    //label.innerHTML = slider.value;
    setLabel(slider.value);
    this._map.setFilter(filter.layerId, [ filter.operator, filter.property, props.value ]);
    container.append(label, slider);
    this._container.append(container);
    return container;
  }
}


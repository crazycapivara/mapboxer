export default class PanelControl {
  constructor(options) {
    this._options = options || { items: [ ] };
    this._sliders = [ ];
  }

  onAdd(map) {
    this._map = map;
    this._container = document.createElement("div");
    this._container.classList.add("mapboxgl-ctrl", "mapboxer-panel-ctrl");
    this._container.style.cssText = this._options.cssText || "";
    //this._container.innerHTML = "Control Panel";
    console.log("control panel", this._options);
    this._options.items.forEach(item => {
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
    const getExpression = () => [filter.operator, filter.property, parseInt(slider.value)];
    slider.onchange = (e) => {
      //label.innerHTML = e.target.value;
      setLabel(e.target.value);
      //const expression = [ filter.operator, filter.property, parseInt(e.target.value) ];
      //const expression = getExpression();
      const expression = this._getFilterExpressions(filter.layerId);
      console.log(expression);
      this._map.setFilter(filter.layerId, expression);
    };

    //label.innerHTML = slider.value;
    setLabel(slider.value);
    //this._map.setFilter(filter.layerId, [ filter.operator, filter.property, props.value ]);
    this._sliders.push({
      layerId: filter.layerId,
      getExpression
    });
    this._map.setFilter(filter.layerId, this._getFilterExpressions(filter.layerId));

    // Add container
    container.append(label, slider);
    this._container.append(container);
    return container;
  }

  _getFilterExpressions(layerId) {
    const expressions = this._sliders.filter(slider => slider.layerId === layerId)
      .map(slider => slider.getExpression());
    return [ "all" ].concat(expressions);
  }
}


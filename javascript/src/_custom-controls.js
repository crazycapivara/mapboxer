import { render } from "mustache";

class TextControl {
  constructor(options) {
    this._options = options || { };
  }

  onAdd(map) {
    this._map = map;
    this._container = document.createElement("div");
    this._container.classList.add("mapboxgl-ctrl", "mapboxer-text-ctrl");
    this._container.style.cssText = this._options.cssText || "";
    this._container.innerHTML = this._options.text || "Hello mapboxer!";
    return this._container;
  }

  onRemove() {
    this._container.parentNode.removeChild(this._container);
    this._map = undefined;
  }
}

class MousePositionControl {
  constructor(options) {
    this._options = options || { };
  }

  onAdd(map) {
    this._map = map;
    this._container = document.createElement("div");
    this._container.classList.add("mapboxgl-ctrl", "mapboxer-mouse-position-ctrl");
    this._container.style.cssText = this._options.cssText || "";
    const mustacheTemplate = this._options.mustacheTemplate || "{{lng}}, {{lat}}";
    this._map.on("mousemove", e => {
      this._container.innerHTML = render(mustacheTemplate, e.lngLat);
    });
    this._map.on("mouseout", e => {
      this._container.innerHTML = "";
      this._container.style.display = "none";
    });
    this._map.on("mouseover", e => {
      this._container.style.display = "block";
    });
    return this._container;
  }

  onRemove() {
    this._container.parentNode.removeChild(this._container);
    this._map = undefined;
  }
}

class FilterControl {
  constructor(options) {
    this._options = options || { };
  }

  onAdd(map) {
    this._map = map;
    this._container = document.createElement("div");
    this._container.classList.add("mapboxgl-ctrl", "mapboxer-filter-ctrl");
    this._container.style.cssText = this._options.cssText || "";
    // this._container.innerText = "Filter: ";

    // const input = document.createElement("input");
    // Object.assign(input, { type: "text", spellcheck: false, id: "filter" });
    const input = document.createElement("textarea");
    Object.assign(input, { spellcheck: false, id: "filter", rows: 5 });
    if (this._options.filter) {
      input.value = JSON.stringify(this._options.filter);
      map.on("load", () => map.setFilter(this._options.layer, this._options.filter));
    }

    input.addEventListener("keyup", e => {
      const expressionString = input.value;
      try {
        const expression = JSON.parse(expressionString);
        map.setFilter(this._options.layer, expression);
      } catch(err) {
        // console.log(err);
      }
    });
    this._container.append(input);
    return this._container;
  }

  onRemove() {
    this._container.parentNode.removeChild(this._container);
    this._map = undefined;
  }
}

export default {
  TextControl,
  MousePositionControl,
  FilterControl
};

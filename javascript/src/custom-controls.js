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
    this._container.textContent = this._options.text || 'Hello, world';
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
    const mustacheString = this._options.mustacheString || "{{lng}}, {{lat}}";
    this._map.on("mousemove", e => {
      this._container.innerHTML = render(mustacheString, e.lngLat);
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

export default {
  TextControl,
  MousePositionControl
};

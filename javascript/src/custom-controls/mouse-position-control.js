import { render } from "mustache";

export default class MousePositionControl {
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

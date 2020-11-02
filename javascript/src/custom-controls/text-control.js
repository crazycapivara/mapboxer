export default class TextControl {
  constructor(options) {
    this._options = options || { };
  }

  onAdd(map) {
    this._map = map;
    this._container = document.createElement("div");
    this._container.classList.add("mapboxgl-ctrl", "mapboxer-text-ctrl");
    //(options.classNames || [ ]).forEach(className => this.container.classList.add(className));
    this._container.style.cssText = this._options.cssText || "";
    this._container.innerHTML = this._options.text || "Hello mapboxer!";
    return this._container;
  }

  onRemove() {
    this._container.parentNode.removeChild(this._container);
    this._map = undefined;
  }

  getContainer() {
    return this._container;
  }
}

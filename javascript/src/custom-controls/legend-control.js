export default class LegendControl {
  constructor(options) {
    this._options = options || { };
  }

  onAdd(map) {
    this._map = map;
    this._container = document.createElement("div");
    this._container.classList.add("mapboxgl-ctrl", "mapboxer-text-ctrl", "mapboxer-legend");
    this._container.style.cssText = this._options.cssText || "";
    console.log(this._options.items);
    const html = `
      <ul>
        <li>Label 1</li>
        <li>Label 2</li>
      </ul>
    `;
    this._container.innerHTML = html;
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

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
    const items = this._options.items.map(item => `
      <li>
        <span class="point-mark" style="background-color: ${item.color}"></span>
        <span>${item.label}</span>
      </li>
    `);
    const html = `
      <ul>
        ${items.join("")}
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

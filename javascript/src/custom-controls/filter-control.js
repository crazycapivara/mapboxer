export default class FilterControl {
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
    Object.assign(input, { spellcheck: false, id: "filter" }, this._options.textareaAttributes);
    if (this._options.filter) {
      input.value = JSON.stringify(this._options.filter);
      map.setFilter(this._options.layer, this._options.filter);
      // map.on("load", () => map.setFilter(this._options.layer, this._options.filter));
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

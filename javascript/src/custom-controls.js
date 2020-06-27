class TextControl {
  constructor(options) {
    this._options = options || { };
  }

  onAdd(map) {
    this._map = map;
    this._container = document.createElement('div');
    this._container.className = 'mapboxgl-ctrl';
    this._container.style.cssText = this._options.cssText ||
      "background: white; padding: 10px; border-radius: 5px;";
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
    this._container = document.createElement('div');
    this._container.className = 'mapboxgl-ctrl';
    this._container.style.cssText = this._options.cssText ||
      "background: white; padding: 10px; border-radius: 4px;";
    //this._container.textContent = this._options.text || 'Hello, world';
    map.on("mousemove", e => {
      // console.log(e.lngLat);
      this._container.innerText = `${e.lngLat.lng}, ${e.lngLat.lat}, ${map.getZoom()}`;
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

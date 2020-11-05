!function(e){var t={};function n(o){if(t[o])return t[o].exports;var r=t[o]={i:o,l:!1,exports:{}};return e[o].call(r.exports,r,r.exports,n),r.l=!0,r.exports}n.m=e,n.c=t,n.d=function(e,t,o){n.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:o})},n.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},n.t=function(e,t){if(1&t&&(e=n(e)),8&t)return e;if(4&t&&"object"==typeof e&&e&&e.__esModule)return e;var o=Object.create(null);if(n.r(o),Object.defineProperty(o,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var r in e)n.d(o,r,function(t){return e[t]}.bind(null,r));return o},n.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return n.d(t,"a",t),t},n.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},n.p="",n(n.s=4)}([function(e,t,n){e.exports=function(){"use strict";
/*!
   * mustache.js - Logic-less {{mustache}} templates with JavaScript
   * http://github.com/janl/mustache.js
   */var e=Object.prototype.toString,t=Array.isArray||function(t){return"[object Array]"===e.call(t)};function n(e){return"function"==typeof e}function o(e){return e.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g,"\\$&")}function r(e,t){return null!=e&&"object"==typeof e&&t in e}var i=RegExp.prototype.test,s=/\S/;function a(e){return!function(e,t){return i.call(e,t)}(s,e)}var c={"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;","/":"&#x2F;","`":"&#x60;","=":"&#x3D;"},l=/\s*/,p=/\s+/,u=/\s*=/,d=/\s*\}/,h=/#|\^|\/|>|\{|&|=|!/;function f(e){this.string=e,this.tail=e,this.pos=0}function m(e,t){this.view=e,this.cache={".":this.view},this.parent=t}function g(){this.templateCache={_cache:{},set:function(e,t){this._cache[e]=t},get:function(e){return this._cache[e]},clear:function(){this._cache={}}}}f.prototype.eos=function(){return""===this.tail},f.prototype.scan=function(e){var t=this.tail.match(e);if(!t||0!==t.index)return"";var n=t[0];return this.tail=this.tail.substring(n.length),this.pos+=n.length,n},f.prototype.scanUntil=function(e){var t,n=this.tail.search(e);switch(n){case-1:t=this.tail,this.tail="";break;case 0:t="";break;default:t=this.tail.substring(0,n),this.tail=this.tail.substring(n)}return this.pos+=t.length,t},m.prototype.push=function(e){return new m(e,this)},m.prototype.lookup=function(e){var t,o,i,s=this.cache;if(s.hasOwnProperty(e))t=s[e];else{for(var a,c,l,p=this,u=!1;p;){if(e.indexOf(".")>0)for(a=p.view,c=e.split("."),l=0;null!=a&&l<c.length;)l===c.length-1&&(u=r(a,c[l])||(o=a,i=c[l],null!=o&&"object"!=typeof o&&o.hasOwnProperty&&o.hasOwnProperty(i))),a=a[c[l++]];else a=p.view[e],u=r(p.view,e);if(u){t=a;break}p=p.parent}s[e]=t}return n(t)&&(t=t.call(this.view)),t},g.prototype.clearCache=function(){void 0!==this.templateCache&&this.templateCache.clear()},g.prototype.parse=function(e,n){var r=this.templateCache,i=e+":"+(n||v.tags).join(":"),s=void 0!==r,c=s?r.get(i):void 0;return null==c&&(c=function(e,n){if(!e)return[];var r,i,s,c=!1,m=[],g=[],y=[],b=!1,x=!1,_="",w=0;function C(){if(b&&!x)for(;y.length;)delete g[y.pop()];else y=[];b=!1,x=!1}function T(e){if("string"==typeof e&&(e=e.split(p,2)),!t(e)||2!==e.length)throw new Error("Invalid tags: "+e);r=new RegExp(o(e[0])+"\\s*"),i=new RegExp("\\s*"+o(e[1])),s=new RegExp("\\s*"+o("}"+e[1]))}T(n||v.tags);for(var k,L,j,M,E,O,S=new f(e);!S.eos();){if(k=S.pos,j=S.scanUntil(r))for(var F=0,P=j.length;F<P;++F)a(M=j.charAt(F))?(y.push(g.length),_+=M):(x=!0,c=!0,_+=" "),g.push(["text",M,k,k+1]),k+=1,"\n"===M&&(C(),_="",w=0,c=!1);if(!S.scan(r))break;if(b=!0,L=S.scan(h)||"name",S.scan(l),"="===L?(j=S.scanUntil(u),S.scan(u),S.scanUntil(i)):"{"===L?(j=S.scanUntil(s),S.scan(d),S.scanUntil(i),L="&"):j=S.scanUntil(i),!S.scan(i))throw new Error("Unclosed tag at "+S.pos);if(E=">"==L?[L,j,k,S.pos,_,w,c]:[L,j,k,S.pos],w++,g.push(E),"#"===L||"^"===L)m.push(E);else if("/"===L){if(!(O=m.pop()))throw new Error('Unopened section "'+j+'" at '+k);if(O[1]!==j)throw new Error('Unclosed section "'+O[1]+'" at '+k)}else"name"===L||"{"===L||"&"===L?x=!0:"="===L&&T(j)}if(C(),O=m.pop())throw new Error('Unclosed section "'+O[1]+'" at '+S.pos);return function(e){for(var t,n=[],o=n,r=[],i=0,s=e.length;i<s;++i)switch((t=e[i])[0]){case"#":case"^":o.push(t),r.push(t),o=t[4]=[];break;case"/":r.pop()[5]=t[2],o=r.length>0?r[r.length-1][4]:n;break;default:o.push(t)}return n}(function(e){for(var t,n,o=[],r=0,i=e.length;r<i;++r)(t=e[r])&&("text"===t[0]&&n&&"text"===n[0]?(n[1]+=t[1],n[3]=t[3]):(o.push(t),n=t));return o}(g))}(e,n),s&&r.set(i,c)),c},g.prototype.render=function(e,t,n,o){var r=this.parse(e,o),i=t instanceof m?t:new m(t,void 0);return this.renderTokens(r,i,n,e,o)},g.prototype.renderTokens=function(e,t,n,o,r){for(var i,s,a,c="",l=0,p=e.length;l<p;++l)a=void 0,"#"===(s=(i=e[l])[0])?a=this.renderSection(i,t,n,o):"^"===s?a=this.renderInverted(i,t,n,o):">"===s?a=this.renderPartial(i,t,n,r):"&"===s?a=this.unescapedValue(i,t):"name"===s?a=this.escapedValue(i,t):"text"===s&&(a=this.rawValue(i)),void 0!==a&&(c+=a);return c},g.prototype.renderSection=function(e,o,r,i){var s=this,a="",c=o.lookup(e[1]);if(c){if(t(c))for(var l=0,p=c.length;l<p;++l)a+=this.renderTokens(e[4],o.push(c[l]),r,i);else if("object"==typeof c||"string"==typeof c||"number"==typeof c)a+=this.renderTokens(e[4],o.push(c),r,i);else if(n(c)){if("string"!=typeof i)throw new Error("Cannot use higher-order sections without the original template");null!=(c=c.call(o.view,i.slice(e[3],e[5]),(function(e){return s.render(e,o,r)})))&&(a+=c)}else a+=this.renderTokens(e[4],o,r,i);return a}},g.prototype.renderInverted=function(e,n,o,r){var i=n.lookup(e[1]);if(!i||t(i)&&0===i.length)return this.renderTokens(e[4],n,o,r)},g.prototype.indentPartial=function(e,t,n){for(var o=t.replace(/[^ \t]/g,""),r=e.split("\n"),i=0;i<r.length;i++)r[i].length&&(i>0||!n)&&(r[i]=o+r[i]);return r.join("\n")},g.prototype.renderPartial=function(e,t,o,r){if(o){var i=n(o)?o(e[1]):o[e[1]];if(null!=i){var s=e[6],a=e[5],c=e[4],l=i;return 0==a&&c&&(l=this.indentPartial(i,c,s)),this.renderTokens(this.parse(l,r),t,o,l,r)}}},g.prototype.unescapedValue=function(e,t){var n=t.lookup(e[1]);if(null!=n)return n},g.prototype.escapedValue=function(e,t){var n=t.lookup(e[1]);if(null!=n)return v.escape(n)},g.prototype.rawValue=function(e){return e[1]};var v={name:"mustache.js",version:"4.0.1",tags:["{{","}}"],clearCache:void 0,escape:void 0,parse:void 0,render:void 0,Scanner:void 0,Context:void 0,Writer:void 0,set templateCache(e){y.templateCache=e},get templateCache(){return y.templateCache}},y=new g;return v.clearCache=function(){return y.clearCache()},v.parse=function(e,t){return y.parse(e,t)},v.render=function(e,n,o,r){if("string"!=typeof e)throw new TypeError('Invalid template! Template should be a "string" but "'+(t(i=e)?"array":typeof i)+'" was given as the first argument for mustache#render(template, view, partials)');var i;return y.render(e,n,o,r)},v.escape=function(e){return String(e).replace(/[&<>"'`=\/]/g,(function(e){return c[e]}))},v.Scanner=f,v.Context=m,v.Writer=g,v}()},function(e,t,n){"use strict";n.d(t,"a",(function(){return o}));const o="MAPBOXER"},function(e,t,n){"use strict";var o={};n.r(o),n.d(o,"TextControl",(function(){return i})),n.d(o,"MousePositionControl",(function(){return s})),n.d(o,"FilterControl",(function(){return a})),n.d(o,"LegendControl",(function(){return c})),n.d(o,"PanelControl",(function(){return l}));var r=n(0);class i{constructor(e){this._options=e||{}}onAdd(e){return this._map=e,this._container=document.createElement("div"),this._container.classList.add("mapboxgl-ctrl","mapboxer-text-ctrl"),this._container.style.cssText=this._options.cssText||"",this._container.innerHTML=this._options.text||"Hello mapboxer!",this._container}onRemove(){this._container.parentNode.removeChild(this._container),this._map=void 0}getContainer(){return this._container}}class s{constructor(e){this._options=e||{}}onAdd(e){this._map=e,this._container=document.createElement("div"),this._container.classList.add("mapboxgl-ctrl","mapboxer-mouse-position-ctrl"),this._container.style.cssText=this._options.cssText||"";const t=this._options.mustacheTemplate||"{{lng}}, {{lat}}";return this._map.on("mousemove",e=>{this._container.innerHTML=Object(r.render)(t,e.lngLat)}),this._map.on("mouseout",e=>{this._container.innerHTML="",this._container.style.display="none"}),this._map.on("mouseover",e=>{this._container.style.display="block"}),this._container}onRemove(){this._container.parentNode.removeChild(this._container),this._map=void 0}}class a{constructor(e){this._options=e||{}}onAdd(e){this._map=e,this._container=document.createElement("div"),this._container.classList.add("mapboxgl-ctrl","mapboxer-filter-ctrl"),this._container.style.cssText=this._options.cssText||"";const t=document.createElement("textarea");return Object.assign(t,{spellcheck:!1,id:"filter"},this._options.textareaAttributes),this._options.filter&&(t.value=JSON.stringify(this._options.filter),e.setFilter(this._options.layerId,this._options.filter)),t.addEventListener("keyup",n=>{const o=t.value;try{const t=JSON.parse(o);e.setFilter(this._options.layerId,t)}catch(e){}}),this._container.append(t),this._container}onRemove(){this._container.parentNode.removeChild(this._container),this._map=void 0}}class c{constructor(e){this._options=e||{}}onAdd(e){this._map=e,this._container=document.createElement("div"),this._container.classList.add("mapboxgl-ctrl","mapboxer-legend-ctrl"),this._container.style.cssText=this._options.cssText||"",console.log(this._options.items);const t=this._options.items.map(e=>`\n      <li>\n        <span class="point-mark" style="background-color: ${e.color}"></span>\n        <span>${e.label}</span>\n      </li>\n    `),n=`\n      <div class="mapboxer-legend">\n        <div class="mapboxer-legend-title">${this._options.title||""}</div>\n        <div class="mapboxer-legend-items"><ul>${t.join("")}</ul></div>\n      </div>\n    `;return this._container.innerHTML=n,this._container}onRemove(){this._container.parentNode.removeChild(this._container),this._map=void 0}}class l{constructor(e){this._options=e||{items:[]},this._sliders=[]}onAdd(e){return this._map=e,this._container=document.createElement("div"),this._container.classList.add("mapboxgl-ctrl","mapboxer-panel-ctrl"),this._container.style.cssText=this._options.cssText||"",console.log("control panel",this._options),this._options.items.forEach(e=>{"Slider"===e.type&&this._addSlider(e)}),this._container}onRemove(){this._container.parentNode.removeChild(this._container),this._map=void 0}_addSlider({props:e,filter:t}){const n=document.createElement("div");n.classList.add("mapboxer-slider-ctrl");const o=document.createElement("label"),r=document.createElement("input");r.type="range",Object.assign(r,e);const i=e=>{o.innerHTML=[t.property,t.operator,e].join(" ")};return r.onchange=e=>{i(e.target.value);const n=this._getFilterExpressions(t.layerId);console.log(n),this._map.setFilter(t.layerId,n)},i(r.value),this._sliders.push({layerId:t.layerId,getExpression:()=>[t.operator,t.property,parseInt(r.value)]}),this._map.setFilter(t.layerId,this._getFilterExpressions(t.layerId)),n.append(o,r),this._container.append(n),n}_getFilterExpressions(e){const t=this._sliders.filter(t=>t.layerId===e).map(e=>e.getExpression());return["all"].concat(t)}}var p=n(1);function u(e){return"string"==typeof e&&e.startsWith("@=")}t.a={addControl:function(e){const t=new mapboxgl[e.controlName](e.options);this.addControl(t,e.pos)},addSource:function(e){this.addSource(e.id,e.source)},addLayer:function(e){const t=this;e.style.source=e.style.source||p.a,t.addLayer(e.style);const n=e.style.id;t.on("mouseenter",n,()=>t.getCanvas().style.cursor="pointer"),t.on("mouseleave",n,()=>t.getCanvas().style.cursor=""),HTMLWidgets.shinyMode&&t.on("click",e.style.id,e=>{const n=t.getContainer().id,o=e.features[0],r={coords:e.lngLat,props:o.properties,layer_id:o.layer.id,widget_id:n};console.log(r),Shiny.onInputChange(n+"_onclick",r)})},addPopups:function(e){const t=this,n=e.layerId;t.on("click",n,n=>{const o=Object.values(n.lngLat),i=n.features[0],s=Object(r.render)(e.template,i.properties);new mapboxgl.Popup(e.options||{}).setLngLat(o).setHTML(s).addTo(t)})},addTooltips:function(e){const t=this,n=e.layerId,o=new mapboxgl.Popup({closeButton:!1,closeOnClick:!1});t.on("mousemove",n,n=>{const i=Object.values(n.lngLat),s=n.features[0],a=Object(r.render)(e.template,s.properties);o.setLngLat(i).setHTML(a).addTo(t)}),t.on("mouseleave",n,()=>{o.remove()})},addMarker:function(e){const t=(new mapboxgl.Marker).setLngLat([e.lng,e.lat]);t.getElement().style.cursor="pointer",e.popup&&t.setPopup((new mapboxgl.Popup).setHTML(e.popup)),t.addTo(this)},addCustomControl:function(e){const t=new o[e.controlName](e.options);this.addControl(t,e.pos)},customControls:o,setFilter:function(e){this.setFilter(e.layerId,e.filter)},setPaintProperty:function(e){this.setPaintProperty(e.layer,e.property,e.value)},setLayoutProperty:function(e){this.setLayoutProperty(e.layer,e.property,e.value)},setData:function(e){const t=e.source||p.a;this.getSource(t).setData(e.data)},fitBounds:function(e){this.fitBounds(e.bounds,e.options||{})},setStyle:function(e){this.setStyle(e.style)},addDrawControl:function(e){const t=new MapboxDraw(e.options);this.addControl(t,e.pos),e.data&&t.add(e.data),this.on("draw.create",e=>{console.log(e.features),console.log(t.getAll())})},addDeckLayer:function(e){const t=this;if(console.log("deck.gl",deck.version),e.props.type=deck[e.type],e.popup){const n=new mapboxgl.Popup({closeOnClick:!1});e.props.pickable=!0,e.props.onClick=({object:o,lngLat:i})=>{console.log(o),console.log(i),n.setLngLat(i).setHTML(Object(r.render)(e.popup,o)).addTo(t)}}"object"==typeof e.props.data&&(e.props.data=HTMLWidgets.dataframeToD3(e.props.data));const n={};for(let t in e.props){const o=e.props[t];u(o)&&(console.log(o),n[t]=e=>JSON.parse(Object(r.render)(o.replace("@=",""),e)))}Object.assign(e.props,n),console.log(e.props);const o=new deck.MapboxLayer(e.props);t.addLayer(o)}}},function(e,t,n){"use strict";(function(e){n(6);var o=n(2),r=n(1);const i=e.mapboxer={methods:o.a,_widget:{}};t.a=function(e,t,n){let s=null;const a=i._widget[e.id]={};return HTMLWidgets.shinyMode&&Shiny.addCustomMessageHandler("mapboxer",t=>{console.log("proxyObject",t),t.id===e.id&&(console.log("Updating "+e.id),t.widgetData.calls.forEach(({methodName:e,args:t})=>o.a[e].call(s,t)))}),{renderValue:function(t){console.log("mapboxgl",mapboxgl.version),console.log("widgetData",t);const n=t.mapProps.style;"object"==typeof n&&(n.sources=n.sources||{},Object.values(n.sources).forEach(e=>{e.hasOwnProperty("tiles")&!Array.isArray(e.tiles)&&(e.tiles=Array(e.tiles))})),mapboxgl.accessToken=t.accessToken||null,t.mapProps.container=e.id,s=a.map=new mapboxgl.Map(t.mapProps),s.on("error",e=>{throw e.error}),t.source&&s.on("load",()=>o.a.addSource.call(s,{id:r.a,source:t.source})),s.on("load",()=>t.calls.forEach(({methodName:e,args:t})=>{o.a[e].call(s,t)}))},resize:function(e,t){}}}}).call(this,n(5))},function(e,t,n){"use strict";n.r(t);var o=n(3);HTMLWidgets.widget({name:"mapboxer",type:"output",factory:o.a})},function(e,t){var n;n=function(){return this}();try{n=n||new Function("return this")()}catch(e){"object"==typeof window&&(n=window)}e.exports=n},function(e,t,n){var o=n(7),r=n(8);"string"==typeof(r=r.__esModule?r.default:r)&&(r=[[e.i,r,""]]);var i={insert:"head",singleton:!1};o(r,i);e.exports=r.locals||{}},function(e,t,n){"use strict";var o,r=function(){return void 0===o&&(o=Boolean(window&&document&&document.all&&!window.atob)),o},i=function(){var e={};return function(t){if(void 0===e[t]){var n=document.querySelector(t);if(window.HTMLIFrameElement&&n instanceof window.HTMLIFrameElement)try{n=n.contentDocument.head}catch(e){n=null}e[t]=n}return e[t]}}(),s=[];function a(e){for(var t=-1,n=0;n<s.length;n++)if(s[n].identifier===e){t=n;break}return t}function c(e,t){for(var n={},o=[],r=0;r<e.length;r++){var i=e[r],c=t.base?i[0]+t.base:i[0],l=n[c]||0,p="".concat(c," ").concat(l);n[c]=l+1;var u=a(p),d={css:i[1],media:i[2],sourceMap:i[3]};-1!==u?(s[u].references++,s[u].updater(d)):s.push({identifier:p,updater:g(d,t),references:1}),o.push(p)}return o}function l(e){var t=document.createElement("style"),o=e.attributes||{};if(void 0===o.nonce){var r=n.nc;r&&(o.nonce=r)}if(Object.keys(o).forEach((function(e){t.setAttribute(e,o[e])})),"function"==typeof e.insert)e.insert(t);else{var s=i(e.insert||"head");if(!s)throw new Error("Couldn't find a style target. This probably means that the value for the 'insert' parameter is invalid.");s.appendChild(t)}return t}var p,u=(p=[],function(e,t){return p[e]=t,p.filter(Boolean).join("\n")});function d(e,t,n,o){var r=n?"":o.media?"@media ".concat(o.media," {").concat(o.css,"}"):o.css;if(e.styleSheet)e.styleSheet.cssText=u(t,r);else{var i=document.createTextNode(r),s=e.childNodes;s[t]&&e.removeChild(s[t]),s.length?e.insertBefore(i,s[t]):e.appendChild(i)}}function h(e,t,n){var o=n.css,r=n.media,i=n.sourceMap;if(r?e.setAttribute("media",r):e.removeAttribute("media"),i&&"undefined"!=typeof btoa&&(o+="\n/*# sourceMappingURL=data:application/json;base64,".concat(btoa(unescape(encodeURIComponent(JSON.stringify(i))))," */")),e.styleSheet)e.styleSheet.cssText=o;else{for(;e.firstChild;)e.removeChild(e.firstChild);e.appendChild(document.createTextNode(o))}}var f=null,m=0;function g(e,t){var n,o,r;if(t.singleton){var i=m++;n=f||(f=l(t)),o=d.bind(null,n,i,!1),r=d.bind(null,n,i,!0)}else n=l(t),o=h.bind(null,n,t),r=function(){!function(e){if(null===e.parentNode)return!1;e.parentNode.removeChild(e)}(n)};return o(e),function(t){if(t){if(t.css===e.css&&t.media===e.media&&t.sourceMap===e.sourceMap)return;o(e=t)}else r()}}e.exports=function(e,t){(t=t||{}).singleton||"boolean"==typeof t.singleton||(t.singleton=r());var n=c(e=e||[],t);return function(e){if(e=e||[],"[object Array]"===Object.prototype.toString.call(e)){for(var o=0;o<n.length;o++){var r=a(n[o]);s[r].references--}for(var i=c(e,t),l=0;l<n.length;l++){var p=a(n[l]);0===s[p].references&&(s[p].updater(),s.splice(p,1))}n=i}}}},function(e,t,n){(t=n(9)(!1)).push([e.i,"canvas:focus {\n  outline: none;\n}\n\n.mapboxer-text-ctrl, .mapboxer-mouse-position-ctrl,\n.mapboxer-legend-ctrl, .mapboxer-panel-ctrl /*, .mapboxer-filter-ctrl */ {\n  background: #FFFFFF;\n  border-radius: 4px;\n  padding: 8px;\n}\n\n.mapboxer-mouse-position-ctrl {\n  width: 300px;\n  text-align: center;\n  display: none;\n}\n\n.mapboxer-mouse-position-ctrl:empty {\n  display: none;\n}\n\n.mapboxer-filter-ctrl-unused {\n  /* background: #323232; */\n  background: none;\n  color: #FFFFFF;\n  /* display: flex; */\n  padding: 2px;\n}\n\n/* input[type='text'] */\n.mapboxer-filter-ctrl textarea {\n  /* font: 10pt \"mono\", sans-serif; */\n  font: 16px/normal 'Monaco', 'Menlo', 'Ubuntu Mono', 'Consolas', 'source-code-pro', monospace;\n  padding: 5px;\n  background: rgba(0, 0, 0, 0.7);\n  color: #FFFFFF;\n  /* border: 1px solid #46514E; */\n  resize: none;\n  vertical-align: middle;\n}\n\n.mapboxer-slider-ctrl {\n  display: flex;\n  align-items: center;\n  /*padding: 5px;*/\n}\n\n.mapboxer-slider-ctrl label {\n  width: 40%;\n  /*padding-right: 10px;*/\n  margin-right: 10px;\n  margin-top: 3px;\n  margin-bottom: 3px;\n}\n\n/* Legend */\n.mapboxer-legend ul {\n  padding: 0;\n  margin-bottom: 0;\n}\n\n.mapboxer-legend li {\n  list-style-type: none;\n  /*margin: 0 0 8px 0;*/\n  display: flex;\n  vertical-align: middle;\n}\n\n.point-mark {\n  width: 12px;\n  height: 12px;\n  align-self: center;\n  border-radius: 50%;\n  border: 1px solid black;\n  margin-right: 12px;\n  box-sizing: border-box;\n  display: inline-block;\n}\n",""]),e.exports=t},function(e,t,n){"use strict";e.exports=function(e){var t=[];return t.toString=function(){return this.map((function(t){var n=function(e,t){var n=e[1]||"",o=e[3];if(!o)return n;if(t&&"function"==typeof btoa){var r=(s=o,a=btoa(unescape(encodeURIComponent(JSON.stringify(s)))),c="sourceMappingURL=data:application/json;charset=utf-8;base64,".concat(a),"/*# ".concat(c," */")),i=o.sources.map((function(e){return"/*# sourceURL=".concat(o.sourceRoot||"").concat(e," */")}));return[n].concat(i).concat([r]).join("\n")}var s,a,c;return[n].join("\n")}(t,e);return t[2]?"@media ".concat(t[2]," {").concat(n,"}"):n})).join("")},t.i=function(e,n,o){"string"==typeof e&&(e=[[null,e,""]]);var r={};if(o)for(var i=0;i<this.length;i++){var s=this[i][0];null!=s&&(r[s]=!0)}for(var a=0;a<e.length;a++){var c=[].concat(e[a]);o&&r[c[0]]||(n&&(c[2]?c[2]="".concat(n," and ").concat(c[2]):c[2]=n),t.push(c))}},t}}]);
require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"TextInput":[function(require,module,exports){
var TextInput,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

TextInput = (function(superClass) {
  extend(TextInput, superClass);

  function TextInput(options) {
    TextInput.__super__.constructor.call(this, _.defaults(options, {
      x: Align.center(),
      y: Align.bottom(),
      width: Screen.width,
      height: 60,
      backgroundColor: 'green'
    }));
  }

  TextInput.prototype.setupLayer = function(Layer) {
    layer.parent = this;
    layer.height = 30;
    layer.width = 40;
    return layer.backgroundColor = 'pink';
  };

  return TextInput;

})(Layer);

exports.TextInput = TextInput;


},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}],"symbols/Symbol":[function(require,module,exports){
var copySourceToTarget, copyStatesFromTarget,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

copySourceToTarget = function(source, target) {
  var i, len, ref, results, subLayer;
  if (target == null) {
    target = false;
  }
  if (source.children.length > 0) {
    ref = source.descendants;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      subLayer = ref[i];
      target[subLayer.name] = subLayer.copySingle();
      target[subLayer.name].name = subLayer.name;
      if (subLayer.parent === source) {
        results.push(target[subLayer.name].parent = target);
      } else {
        results.push(target[subLayer.name].parent = target[subLayer.parent.name]);
      }
    }
    return results;
  }
};

copyStatesFromTarget = function(source, target, stateName, animationOptions) {
  var i, j, layer, len, len1, ref, ref1, results, subLayer, targets;
  if (animationOptions == null) {
    animationOptions = false;
  }
  targets = [];
  ref = target.descendants;
  for (i = 0, len = ref.length; i < len; i++) {
    layer = ref[i];
    targets[layer.name] = layer;
  }
  ref1 = source.descendants;
  results = [];
  for (j = 0, len1 = ref1.length; j < len1; j++) {
    subLayer = ref1[j];
    subLayer.states["" + stateName] = targets[subLayer.name].states["default"];
    if (animationOptions) {
      results.push(subLayer.states["" + stateName].animationOptions = animationOptions);
    } else {
      results.push(void 0);
    }
  }
  return results;
};

Layer.prototype.addSymbolState = function(stateName, target, animationOptions) {
  if (animationOptions == null) {
    animationOptions = false;
  }
  this.states["" + stateName] = {
    width: target.states["default"].width,
    height: target.states["default"].height,
    visible: target.states["default"].visible,
    opacity: target.states["default"].opacity,
    clip: target.states["default"].clip,
    scrollHorizontal: target.states["default"].scrollHorizontal,
    scrollVertical: target.states["default"].scrollVertical,
    scroll: target.states["default"].scroll,
    scaleX: target.states["default"].scaleX,
    scaleY: target.states["default"].scaleY,
    scaleZ: target.states["default"].scaleZ,
    scale: target.states["default"].scale,
    skewX: target.states["default"].skewX,
    skewY: target.states["default"].skewY,
    skew: target.states["default"].skew,
    originX: target.states["default"].originX,
    originY: target.states["default"].originY,
    originZ: target.states["default"].originZ,
    perspective: target.states["default"].perspective,
    perspectiveOriginX: target.states["default"].perspectiveOriginX,
    perspectiveOriginY: target.states["default"].perspectiveOriginY,
    rotationX: target.states["default"].rotationX,
    rotationY: target.states["default"].rotationY,
    rotationZ: target.states["default"].rotationZ,
    rotation: target.states["default"].rotation,
    blur: target.states["default"].blur,
    brightness: target.states["default"].brightness,
    saturate: target.states["default"].saturate,
    hueRotate: target.states["default"].hueRotate,
    contrast: target.states["default"].contrast,
    invert: target.states["default"].invert,
    grayscale: target.states["default"].grayscale,
    sepia: target.states["default"].sepia,
    blending: target.states["default"].blending,
    backgroundBlur: target.states["default"].backgroundBlur,
    backgroundBrightness: target.states["default"].backgroundBrightness,
    backgroundSaturate: target.states["default"].backgroundSaturate,
    backgroundHueRotate: target.states["default"].backgroundHueRotate,
    backgroundContrast: target.states["default"].backgroundContrast,
    backgroundInvert: target.states["default"].backgroundInvert,
    backgroundGrayscale: target.states["default"].backgroundGrayscale,
    backgroundSepia: target.states["default"].backgroundSepia,
    shadows: target.states["default"].shadows,
    backgroundColor: target.states["default"].backgroundColor,
    color: target.states["default"].color,
    borderRadius: target.states["default"].borderRadius,
    borderColor: target.states["default"].borderColor,
    borderWidth: target.states["default"].borderWidth,
    borderStyle: target.states["default"].borderStyle,
    force2d: target.states["default"].force2d,
    flat: target.states["default"].flat,
    backfaceVisible: target.states["default"].backfaceVisible,
    htmlIntrinsicSize: target.states["default"].htmlIntrinsicSize,
    html: target.states["default"].html,
    image: target.states["default"].image,
    gradient: target.states["default"].gradient,
    scrollX: target.states["default"].scrollX,
    scrollY: target.states["default"].scrollY
  };
  if (animationOptions) {
    this.states["" + stateName].animationOptions = animationOptions;
  }
  copyStatesFromTarget(this, target, stateName, animationOptions);
  return target.destroy();
};

Layer.prototype.replaceWithSymbol = function(symbol) {
  var i, len, ref, stateName;
  symbol.point = this.point;
  symbol.parent = this.parent;
  ref = symbol.stateNames;
  for (i = 0, len = ref.length; i < len; i++) {
    stateName = ref[i];
    symbol.states["" + stateName].point = this.point;
  }
  return this.destroy();
};

exports.Symbol = function(layer, states, events) {
  var Symbol;
  if (states == null) {
    states = false;
  }
  if (events == null) {
    events = false;
  }
  return Symbol = (function(superClass) {
    extend(Symbol, superClass);

    function Symbol(options) {
      var action, actionProps, base, base1, base10, base11, base12, base13, base14, base15, base16, base17, base18, base19, base2, base20, base21, base22, base23, base24, base25, base26, base27, base28, base29, base3, base30, base31, base32, base33, base34, base35, base36, base37, base38, base39, base4, base40, base41, base42, base43, base44, base45, base46, base47, base48, base49, base5, base50, base51, base52, base53, base54, base55, base56, base57, base58, base59, base6, base60, base61, base62, base7, base8, base9, stateName, stateProps, trigger, triggerName;
      this.options = options != null ? options : {};
      if ((base = this.options).width == null) {
        base.width = layer.width;
      }
      if ((base1 = this.options).height == null) {
        base1.height = layer.height;
      }
      if ((base2 = this.options).visible == null) {
        base2.visible = layer.visible;
      }
      if ((base3 = this.options).opacity == null) {
        base3.opacity = layer.opacity;
      }
      if ((base4 = this.options).clip == null) {
        base4.clip = layer.clip;
      }
      if ((base5 = this.options).scrollHorizontal == null) {
        base5.scrollHorizontal = layer.scrollHorizontal;
      }
      if ((base6 = this.options).scrollVertical == null) {
        base6.scrollVertical = layer.scrollVertical;
      }
      if ((base7 = this.options).scroll == null) {
        base7.scroll = layer.scroll;
      }
      if ((base8 = this.options).x == null) {
        base8.x = layer.x;
      }
      if ((base9 = this.options).y == null) {
        base9.y = layer.y;
      }
      if ((base10 = this.options).z == null) {
        base10.z = layer.z;
      }
      if ((base11 = this.options).scaleX == null) {
        base11.scaleX = layer.scaleX;
      }
      if ((base12 = this.options).scaleY == null) {
        base12.scaleY = layer.scaleY;
      }
      if ((base13 = this.options).scaleZ == null) {
        base13.scaleZ = layer.scaleZ;
      }
      if ((base14 = this.options).scale == null) {
        base14.scale = layer.scale;
      }
      if ((base15 = this.options).skewX == null) {
        base15.skewX = layer.skewX;
      }
      if ((base16 = this.options).skewY == null) {
        base16.skewY = layer.skewY;
      }
      if ((base17 = this.options).skew == null) {
        base17.skew = layer.skew;
      }
      if ((base18 = this.options).originX == null) {
        base18.originX = layer.originX;
      }
      if ((base19 = this.options).originY == null) {
        base19.originY = layer.originY;
      }
      if ((base20 = this.options).originZ == null) {
        base20.originZ = layer.originZ;
      }
      if ((base21 = this.options).perspective == null) {
        base21.perspective = layer.perspective;
      }
      if ((base22 = this.options).perspectiveOriginX == null) {
        base22.perspectiveOriginX = layer.perspectiveOriginX;
      }
      if ((base23 = this.options).perspectiveOriginY == null) {
        base23.perspectiveOriginY = layer.perspectiveOriginY;
      }
      if ((base24 = this.options).rotationX == null) {
        base24.rotationX = layer.rotationX;
      }
      if ((base25 = this.options).rotationY == null) {
        base25.rotationY = layer.rotationY;
      }
      if ((base26 = this.options).rotationZ == null) {
        base26.rotationZ = layer.rotationZ;
      }
      if ((base27 = this.options).rotation == null) {
        base27.rotation = layer.rotation;
      }
      if ((base28 = this.options).blur == null) {
        base28.blur = layer.blur;
      }
      if ((base29 = this.options).brightness == null) {
        base29.brightness = layer.brightness;
      }
      if ((base30 = this.options).saturate == null) {
        base30.saturate = layer.saturate;
      }
      if ((base31 = this.options).hueRotate == null) {
        base31.hueRotate = layer.hueRotate;
      }
      if ((base32 = this.options).contrast == null) {
        base32.contrast = layer.contrast;
      }
      if ((base33 = this.options).invert == null) {
        base33.invert = layer.invert;
      }
      if ((base34 = this.options).grayscale == null) {
        base34.grayscale = layer.grayscale;
      }
      if ((base35 = this.options).sepia == null) {
        base35.sepia = layer.sepia;
      }
      if ((base36 = this.options).blending == null) {
        base36.blending = layer.blending;
      }
      if ((base37 = this.options).backgroundBlur == null) {
        base37.backgroundBlur = layer.backgroundBlur;
      }
      if ((base38 = this.options).backgroundBrightness == null) {
        base38.backgroundBrightness = layer.backgroundBrightness;
      }
      if ((base39 = this.options).backgroundSaturate == null) {
        base39.backgroundSaturate = layer.backgroundSaturate;
      }
      if ((base40 = this.options).backgroundHueRotate == null) {
        base40.backgroundHueRotate = layer.backgroundHueRotate;
      }
      if ((base41 = this.options).backgroundContrast == null) {
        base41.backgroundContrast = layer.backgroundContrast;
      }
      if ((base42 = this.options).backgroundInvert == null) {
        base42.backgroundInvert = layer.backgroundInvert;
      }
      if ((base43 = this.options).backgroundGrayscale == null) {
        base43.backgroundGrayscale = layer.backgroundGrayscale;
      }
      if ((base44 = this.options).backgroundSepia == null) {
        base44.backgroundSepia = layer.backgroundSepia;
      }
      if ((base45 = this.options).shadows == null) {
        base45.shadows = layer.shadows;
      }
      if ((base46 = this.options).backgroundColor == null) {
        base46.backgroundColor = layer.backgroundColor;
      }
      if ((base47 = this.options).color == null) {
        base47.color = layer.color;
      }
      if ((base48 = this.options).borderRadius == null) {
        base48.borderRadius = layer.borderRadius;
      }
      if ((base49 = this.options).borderColor == null) {
        base49.borderColor = layer.borderColor;
      }
      if ((base50 = this.options).borderWidth == null) {
        base50.borderWidth = layer.borderWidth;
      }
      if ((base51 = this.options).borderStyle == null) {
        base51.borderStyle = layer.borderStyle;
      }
      if ((base52 = this.options).force2d == null) {
        base52.force2d = layer.force2d;
      }
      if ((base53 = this.options).flat == null) {
        base53.flat = layer.flat;
      }
      if ((base54 = this.options).backfaceVisible == null) {
        base54.backfaceVisible = layer.backfaceVisible;
      }
      if ((base55 = this.options).htmlIntrinsicSize == null) {
        base55.htmlIntrinsicSize = layer.htmlIntrinsicSize;
      }
      if ((base56 = this.options).html == null) {
        base56.html = layer.html;
      }
      if ((base57 = this.options).image == null) {
        base57.image = layer.image;
      }
      if ((base58 = this.options).gradient == null) {
        base58.gradient = layer.gradient;
      }
      if ((base59 = this.options).scrollX == null) {
        base59.scrollX = layer.scrollX;
      }
      if ((base60 = this.options).scrollY == null) {
        base60.scrollY = layer.scrollY;
      }
      if ((base61 = this.options).x == null) {
        base61.x = false;
      }
      if ((base62 = this.options).y == null) {
        base62.y = false;
      }
      Symbol.__super__.constructor.call(this, this.options);
      this.customProps = this.options.customProps;
      this.states['default'].x = this.x;
      this.states['default'].y = this.y;
      copySourceToTarget(layer, this);
      if (states) {
        for (stateName in states) {
          stateProps = states[stateName];
          this.addSymbolState(stateName, stateProps.template, stateProps.animationOptions);
        }
      }
      if (events) {
        for (trigger in events) {
          action = events[trigger];
          if (_.isFunction(action)) {
            if (Events[trigger]) {
              this.on(Events[trigger], action);
            }
          } else {
            if (this[trigger]) {
              for (triggerName in action) {
                actionProps = action[triggerName];
                if (Events[triggerName]) {
                  this[trigger].on(Events[triggerName], actionProps);
                }
              }
            }
          }
        }
      }
      this.on(Events.StateSwitchStart, function(from, to) {
        var child, i, len, ref, results;
        ref = this.descendants;
        results = [];
        for (i = 0, len = ref.length; i < len; i++) {
          child = ref[i];
          if (child.constructor.name === "TextLayer") {
            child.states[to].text = child.text;
            child.states[to].textAlign = child.props.styledTextOptions.alignment;
            child.states[to].width = child.width;
            child.states[to].height = child.height;
            if (child.template && Object.keys(child.template).length > 0) {
              child.states[to].template = child.template;
            }
          } else {
            if (child.image && (child.states[to].image !== child.image)) {
              child.states[to].image = child.image;
            }
          }
          results.push(child.animate(to));
        }
        return results;
      });
    }

    layer.destroy();

    return Symbol;

  })(Layer);
};

exports.createSymbol = function(layer, states, events) {
  return exports.Symbol(layer, states, events);
};


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL21hbmhhcnQvRG9jdW1lbnRzLzAyX0Rldi9mcmFtZXItc2tldGNoYm9vay9mcmFtZXItc2tldGNocy93b3JrLTAxLmZyYW1lci9tb2R1bGVzL3N5bWJvbHMvU3ltYm9sLmNvZmZlZSIsIi4uLy4uLy4uLy4uLy4uL1VzZXJzL21hbmhhcnQvRG9jdW1lbnRzLzAyX0Rldi9mcmFtZXItc2tldGNoYm9vay9mcmFtZXItc2tldGNocy93b3JrLTAxLmZyYW1lci9tb2R1bGVzL215TW9kdWxlLmNvZmZlZSIsIi4uLy4uLy4uLy4uLy4uL1VzZXJzL21hbmhhcnQvRG9jdW1lbnRzLzAyX0Rldi9mcmFtZXItc2tldGNoYm9vay9mcmFtZXItc2tldGNocy93b3JrLTAxLmZyYW1lci9tb2R1bGVzL1RleHRJbnB1dC5jb2ZmZWUiLCJub2RlX21vZHVsZXMvYnJvd3Nlci1wYWNrL19wcmVsdWRlLmpzIl0sInNvdXJjZXNDb250ZW50IjpbImNvcHlTb3VyY2VUb1RhcmdldCA9IChzb3VyY2UsIHRhcmdldD1mYWxzZSkgLT5cbiAgaWYgc291cmNlLmNoaWxkcmVuLmxlbmd0aCA+IDBcbiAgICBmb3Igc3ViTGF5ZXIgaW4gc291cmNlLmRlc2NlbmRhbnRzXG4gICAgICB0YXJnZXRbc3ViTGF5ZXIubmFtZV0gPSBzdWJMYXllci5jb3B5U2luZ2xlKClcbiAgICAgIHRhcmdldFtzdWJMYXllci5uYW1lXS5uYW1lID0gc3ViTGF5ZXIubmFtZVxuXG4gICAgICBpZiBzdWJMYXllci5wYXJlbnQgaXMgc291cmNlXG4gICAgICAgIHRhcmdldFtzdWJMYXllci5uYW1lXS5wYXJlbnQgPSB0YXJnZXRcbiAgICAgIGVsc2VcbiAgICAgICAgdGFyZ2V0W3N1YkxheWVyLm5hbWVdLnBhcmVudCA9IHRhcmdldFtzdWJMYXllci5wYXJlbnQubmFtZV1cblxuY29weVN0YXRlc0Zyb21UYXJnZXQgPSAoc291cmNlLCB0YXJnZXQsIHN0YXRlTmFtZSwgYW5pbWF0aW9uT3B0aW9ucz1mYWxzZSkgLT5cbiAgdGFyZ2V0cyA9IFtdXG5cbiAgZm9yIGxheWVyIGluIHRhcmdldC5kZXNjZW5kYW50c1xuICAgIHRhcmdldHNbbGF5ZXIubmFtZV0gPSBsYXllclxuXG4gIGZvciBzdWJMYXllciBpbiBzb3VyY2UuZGVzY2VuZGFudHNcbiAgICBzdWJMYXllci5zdGF0ZXNbXCIje3N0YXRlTmFtZX1cIl0gPSB0YXJnZXRzW3N1YkxheWVyLm5hbWVdLnN0YXRlc1tcImRlZmF1bHRcIl1cblxuICAgIGlmIGFuaW1hdGlvbk9wdGlvbnNcbiAgICAgIHN1YkxheWVyLnN0YXRlc1tcIiN7c3RhdGVOYW1lfVwiXS5hbmltYXRpb25PcHRpb25zID0gYW5pbWF0aW9uT3B0aW9uc1xuXG5MYXllcjo6YWRkU3ltYm9sU3RhdGUgPSAoc3RhdGVOYW1lLCB0YXJnZXQsIGFuaW1hdGlvbk9wdGlvbnM9ZmFsc2UpIC0+XG4gIEAuc3RhdGVzW1wiI3tzdGF0ZU5hbWV9XCJdID1cbiAgICAgIHdpZHRoOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS53aWR0aFxuICAgICAgaGVpZ2h0OiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5oZWlnaHRcbiAgICAgIHZpc2libGU6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnZpc2libGVcbiAgICAgIG9wYWNpdHk6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLm9wYWNpdHlcbiAgICAgIGNsaXA6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmNsaXBcbiAgICAgIHNjcm9sbEhvcml6b250YWw6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnNjcm9sbEhvcml6b250YWxcbiAgICAgIHNjcm9sbFZlcnRpY2FsOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5zY3JvbGxWZXJ0aWNhbFxuICAgICAgc2Nyb2xsOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5zY3JvbGxcbiAgICAgIHNjYWxlWDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uc2NhbGVYXG4gICAgICBzY2FsZVk6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnNjYWxlWVxuICAgICAgc2NhbGVaOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5zY2FsZVpcbiAgICAgIHNjYWxlOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5zY2FsZVxuICAgICAgc2tld1g6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnNrZXdYXG4gICAgICBza2V3WTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uc2tld1lcbiAgICAgIHNrZXc6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnNrZXdcbiAgICAgIG9yaWdpblg6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLm9yaWdpblhcbiAgICAgIG9yaWdpblk6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLm9yaWdpbllcbiAgICAgIG9yaWdpblo6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLm9yaWdpblpcbiAgICAgIHBlcnNwZWN0aXZlOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5wZXJzcGVjdGl2ZVxuICAgICAgcGVyc3BlY3RpdmVPcmlnaW5YOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5wZXJzcGVjdGl2ZU9yaWdpblhcbiAgICAgIHBlcnNwZWN0aXZlT3JpZ2luWTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0ucGVyc3BlY3RpdmVPcmlnaW5ZXG4gICAgICByb3RhdGlvblg6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnJvdGF0aW9uWFxuICAgICAgcm90YXRpb25ZOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5yb3RhdGlvbllcbiAgICAgIHJvdGF0aW9uWjogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0ucm90YXRpb25aXG4gICAgICByb3RhdGlvbjogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0ucm90YXRpb25cbiAgICAgIGJsdXI6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmJsdXJcbiAgICAgIGJyaWdodG5lc3M6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmJyaWdodG5lc3NcbiAgICAgIHNhdHVyYXRlOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5zYXR1cmF0ZVxuICAgICAgaHVlUm90YXRlOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5odWVSb3RhdGVcbiAgICAgIGNvbnRyYXN0OiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5jb250cmFzdFxuICAgICAgaW52ZXJ0OiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5pbnZlcnRcbiAgICAgIGdyYXlzY2FsZTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uZ3JheXNjYWxlXG4gICAgICBzZXBpYTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uc2VwaWFcbiAgICAgIGJsZW5kaW5nOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5ibGVuZGluZ1xuICAgICAgYmFja2dyb3VuZEJsdXI6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmJhY2tncm91bmRCbHVyXG4gICAgICBiYWNrZ3JvdW5kQnJpZ2h0bmVzczogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uYmFja2dyb3VuZEJyaWdodG5lc3NcbiAgICAgIGJhY2tncm91bmRTYXR1cmF0ZTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uYmFja2dyb3VuZFNhdHVyYXRlXG4gICAgICBiYWNrZ3JvdW5kSHVlUm90YXRlOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5iYWNrZ3JvdW5kSHVlUm90YXRlXG4gICAgICBiYWNrZ3JvdW5kQ29udHJhc3Q6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmJhY2tncm91bmRDb250cmFzdFxuICAgICAgYmFja2dyb3VuZEludmVydDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uYmFja2dyb3VuZEludmVydFxuICAgICAgYmFja2dyb3VuZEdyYXlzY2FsZTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uYmFja2dyb3VuZEdyYXlzY2FsZVxuICAgICAgYmFja2dyb3VuZFNlcGlhOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5iYWNrZ3JvdW5kU2VwaWFcbiAgICAgIHNoYWRvd3M6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnNoYWRvd3NcbiAgICAgIGJhY2tncm91bmRDb2xvcjogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uYmFja2dyb3VuZENvbG9yXG4gICAgICBjb2xvcjogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uY29sb3JcbiAgICAgIGJvcmRlclJhZGl1czogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uYm9yZGVyUmFkaXVzXG4gICAgICBib3JkZXJDb2xvcjogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uYm9yZGVyQ29sb3JcbiAgICAgIGJvcmRlcldpZHRoOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5ib3JkZXJXaWR0aFxuICAgICAgYm9yZGVyU3R5bGU6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmJvcmRlclN0eWxlXG4gICAgICBmb3JjZTJkOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5mb3JjZTJkXG4gICAgICBmbGF0OiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5mbGF0XG4gICAgICBiYWNrZmFjZVZpc2libGU6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmJhY2tmYWNlVmlzaWJsZVxuICAgICAgaHRtbEludHJpbnNpY1NpemU6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmh0bWxJbnRyaW5zaWNTaXplXG4gICAgICBodG1sOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5odG1sXG4gICAgICBpbWFnZTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uaW1hZ2VcbiAgICAgIGdyYWRpZW50OiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5ncmFkaWVudFxuICAgICAgc2Nyb2xsWDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uc2Nyb2xsWFxuICAgICAgc2Nyb2xsWTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uc2Nyb2xsWVxuXG4gIGlmIGFuaW1hdGlvbk9wdGlvbnNcbiAgICBALnN0YXRlc1tcIiN7c3RhdGVOYW1lfVwiXS5hbmltYXRpb25PcHRpb25zID0gYW5pbWF0aW9uT3B0aW9uc1xuXG4gIGNvcHlTdGF0ZXNGcm9tVGFyZ2V0KEAsIHRhcmdldCwgc3RhdGVOYW1lLCBhbmltYXRpb25PcHRpb25zKVxuICB0YXJnZXQuZGVzdHJveSgpXG5cbkxheWVyOjpyZXBsYWNlV2l0aFN5bWJvbCA9IChzeW1ib2wpIC0+XG4gIHN5bWJvbC5wb2ludCA9IEAucG9pbnRcbiAgc3ltYm9sLnBhcmVudCA9IEAucGFyZW50XG5cbiAgZm9yIHN0YXRlTmFtZSBpbiBzeW1ib2wuc3RhdGVOYW1lc1xuICAgIHN5bWJvbC5zdGF0ZXNbXCIje3N0YXRlTmFtZX1cIl0ucG9pbnQgPSBALnBvaW50XG4gIEAuZGVzdHJveSgpXG5cbmV4cG9ydHMuU3ltYm9sID0gKGxheWVyLCBzdGF0ZXM9ZmFsc2UsIGV2ZW50cz1mYWxzZSkgLT5cbiAgY2xhc3MgU3ltYm9sIGV4dGVuZHMgTGF5ZXJcbiAgICBjb25zdHJ1Y3RvcjogKEBvcHRpb25zPXt9KSAtPlxuICAgICAgQG9wdGlvbnMud2lkdGggPz0gbGF5ZXIud2lkdGhcbiAgICAgIEBvcHRpb25zLmhlaWdodCA/PSBsYXllci5oZWlnaHRcbiAgICAgIEBvcHRpb25zLnZpc2libGUgPz0gbGF5ZXIudmlzaWJsZVxuICAgICAgQG9wdGlvbnMub3BhY2l0eSA/PSBsYXllci5vcGFjaXR5XG4gICAgICBAb3B0aW9ucy5jbGlwID89IGxheWVyLmNsaXBcbiAgICAgIEBvcHRpb25zLnNjcm9sbEhvcml6b250YWwgPz0gbGF5ZXIuc2Nyb2xsSG9yaXpvbnRhbFxuICAgICAgQG9wdGlvbnMuc2Nyb2xsVmVydGljYWwgPz0gbGF5ZXIuc2Nyb2xsVmVydGljYWxcbiAgICAgIEBvcHRpb25zLnNjcm9sbCA/PSBsYXllci5zY3JvbGxcbiAgICAgIEBvcHRpb25zLnggPz0gbGF5ZXIueFxuICAgICAgQG9wdGlvbnMueSA/PSBsYXllci55XG4gICAgICBAb3B0aW9ucy56ID89IGxheWVyLnpcbiAgICAgIEBvcHRpb25zLnNjYWxlWCA/PSBsYXllci5zY2FsZVhcbiAgICAgIEBvcHRpb25zLnNjYWxlWSA/PSBsYXllci5zY2FsZVlcbiAgICAgIEBvcHRpb25zLnNjYWxlWiA/PSBsYXllci5zY2FsZVpcbiAgICAgIEBvcHRpb25zLnNjYWxlID89IGxheWVyLnNjYWxlXG4gICAgICBAb3B0aW9ucy5za2V3WCA/PSBsYXllci5za2V3WFxuICAgICAgQG9wdGlvbnMuc2tld1kgPz0gbGF5ZXIuc2tld1lcbiAgICAgIEBvcHRpb25zLnNrZXcgPz0gbGF5ZXIuc2tld1xuICAgICAgQG9wdGlvbnMub3JpZ2luWCA/PSBsYXllci5vcmlnaW5YXG4gICAgICBAb3B0aW9ucy5vcmlnaW5ZID89IGxheWVyLm9yaWdpbllcbiAgICAgIEBvcHRpb25zLm9yaWdpblogPz0gbGF5ZXIub3JpZ2luWlxuICAgICAgQG9wdGlvbnMucGVyc3BlY3RpdmUgPz0gbGF5ZXIucGVyc3BlY3RpdmVcbiAgICAgIEBvcHRpb25zLnBlcnNwZWN0aXZlT3JpZ2luWCA/PSBsYXllci5wZXJzcGVjdGl2ZU9yaWdpblhcbiAgICAgIEBvcHRpb25zLnBlcnNwZWN0aXZlT3JpZ2luWSA/PSBsYXllci5wZXJzcGVjdGl2ZU9yaWdpbllcbiAgICAgIEBvcHRpb25zLnJvdGF0aW9uWCA/PSBsYXllci5yb3RhdGlvblhcbiAgICAgIEBvcHRpb25zLnJvdGF0aW9uWSA/PSBsYXllci5yb3RhdGlvbllcbiAgICAgIEBvcHRpb25zLnJvdGF0aW9uWiA/PSBsYXllci5yb3RhdGlvblpcbiAgICAgIEBvcHRpb25zLnJvdGF0aW9uID89IGxheWVyLnJvdGF0aW9uXG4gICAgICBAb3B0aW9ucy5ibHVyID89IGxheWVyLmJsdXJcbiAgICAgIEBvcHRpb25zLmJyaWdodG5lc3MgPz0gbGF5ZXIuYnJpZ2h0bmVzc1xuICAgICAgQG9wdGlvbnMuc2F0dXJhdGUgPz0gbGF5ZXIuc2F0dXJhdGVcbiAgICAgIEBvcHRpb25zLmh1ZVJvdGF0ZSA/PSBsYXllci5odWVSb3RhdGVcbiAgICAgIEBvcHRpb25zLmNvbnRyYXN0ID89IGxheWVyLmNvbnRyYXN0XG4gICAgICBAb3B0aW9ucy5pbnZlcnQgPz0gbGF5ZXIuaW52ZXJ0XG4gICAgICBAb3B0aW9ucy5ncmF5c2NhbGUgPz0gbGF5ZXIuZ3JheXNjYWxlXG4gICAgICBAb3B0aW9ucy5zZXBpYSA/PSBsYXllci5zZXBpYVxuICAgICAgQG9wdGlvbnMuYmxlbmRpbmcgPz0gbGF5ZXIuYmxlbmRpbmdcbiAgICAgIEBvcHRpb25zLmJhY2tncm91bmRCbHVyID89IGxheWVyLmJhY2tncm91bmRCbHVyXG4gICAgICBAb3B0aW9ucy5iYWNrZ3JvdW5kQnJpZ2h0bmVzcyA/PSBsYXllci5iYWNrZ3JvdW5kQnJpZ2h0bmVzc1xuICAgICAgQG9wdGlvbnMuYmFja2dyb3VuZFNhdHVyYXRlID89IGxheWVyLmJhY2tncm91bmRTYXR1cmF0ZVxuICAgICAgQG9wdGlvbnMuYmFja2dyb3VuZEh1ZVJvdGF0ZSA/PSBsYXllci5iYWNrZ3JvdW5kSHVlUm90YXRlXG4gICAgICBAb3B0aW9ucy5iYWNrZ3JvdW5kQ29udHJhc3QgPz0gbGF5ZXIuYmFja2dyb3VuZENvbnRyYXN0XG4gICAgICBAb3B0aW9ucy5iYWNrZ3JvdW5kSW52ZXJ0ID89IGxheWVyLmJhY2tncm91bmRJbnZlcnRcbiAgICAgIEBvcHRpb25zLmJhY2tncm91bmRHcmF5c2NhbGUgPz0gbGF5ZXIuYmFja2dyb3VuZEdyYXlzY2FsZVxuICAgICAgQG9wdGlvbnMuYmFja2dyb3VuZFNlcGlhID89IGxheWVyLmJhY2tncm91bmRTZXBpYVxuICAgICAgQG9wdGlvbnMuc2hhZG93cyA/PSBsYXllci5zaGFkb3dzXG4gICAgICBAb3B0aW9ucy5iYWNrZ3JvdW5kQ29sb3IgPz0gbGF5ZXIuYmFja2dyb3VuZENvbG9yXG4gICAgICBAb3B0aW9ucy5jb2xvciA/PSBsYXllci5jb2xvclxuICAgICAgQG9wdGlvbnMuYm9yZGVyUmFkaXVzID89IGxheWVyLmJvcmRlclJhZGl1c1xuICAgICAgQG9wdGlvbnMuYm9yZGVyQ29sb3IgPz0gbGF5ZXIuYm9yZGVyQ29sb3JcbiAgICAgIEBvcHRpb25zLmJvcmRlcldpZHRoID89IGxheWVyLmJvcmRlcldpZHRoXG4gICAgICBAb3B0aW9ucy5ib3JkZXJTdHlsZSA/PSBsYXllci5ib3JkZXJTdHlsZVxuICAgICAgQG9wdGlvbnMuZm9yY2UyZCA/PSBsYXllci5mb3JjZTJkXG4gICAgICBAb3B0aW9ucy5mbGF0ID89IGxheWVyLmZsYXRcbiAgICAgIEBvcHRpb25zLmJhY2tmYWNlVmlzaWJsZSA/PSBsYXllci5iYWNrZmFjZVZpc2libGVcbiAgICAgIEBvcHRpb25zLmh0bWxJbnRyaW5zaWNTaXplID89IGxheWVyLmh0bWxJbnRyaW5zaWNTaXplXG4gICAgICBAb3B0aW9ucy5odG1sID89IGxheWVyLmh0bWxcbiAgICAgIEBvcHRpb25zLmltYWdlID89IGxheWVyLmltYWdlXG4gICAgICBAb3B0aW9ucy5ncmFkaWVudCA/PSBsYXllci5ncmFkaWVudFxuICAgICAgQG9wdGlvbnMuc2Nyb2xsWCA/PSBsYXllci5zY3JvbGxYXG4gICAgICBAb3B0aW9ucy5zY3JvbGxZID89IGxheWVyLnNjcm9sbFlcblxuICAgICAgQG9wdGlvbnMueCA/PSBmYWxzZVxuICAgICAgQG9wdGlvbnMueSA/PSBmYWxzZVxuXG4gICAgICBzdXBlciBAb3B0aW9uc1xuXG4gICAgICBALmN1c3RvbVByb3BzID0gQG9wdGlvbnMuY3VzdG9tUHJvcHNcblxuICAgICAgQC5zdGF0ZXNbJ2RlZmF1bHQnXS54ID0gQC54XG4gICAgICBALnN0YXRlc1snZGVmYXVsdCddLnkgPSBALnlcblxuICAgICAgY29weVNvdXJjZVRvVGFyZ2V0KGxheWVyLCBAKVxuXG4gICAgICBpZiBzdGF0ZXNcbiAgICAgICAgZm9yIHN0YXRlTmFtZSwgc3RhdGVQcm9wcyBvZiBzdGF0ZXNcbiAgICAgICAgICBALmFkZFN5bWJvbFN0YXRlKHN0YXRlTmFtZSwgc3RhdGVQcm9wcy50ZW1wbGF0ZSwgc3RhdGVQcm9wcy5hbmltYXRpb25PcHRpb25zKVxuXG4gICAgICBpZiBldmVudHNcbiAgICAgICAgZm9yIHRyaWdnZXIsIGFjdGlvbiBvZiBldmVudHNcbiAgICAgICAgICBpZiBfLmlzRnVuY3Rpb24oYWN0aW9uKVxuICAgICAgICAgICAgaWYgRXZlbnRzW3RyaWdnZXJdXG4gICAgICAgICAgICAgIEBvbiBFdmVudHNbdHJpZ2dlcl0sIGFjdGlvblxuICAgICAgICAgIGVsc2VcbiAgICAgICAgICAgIGlmIEBbdHJpZ2dlcl1cbiAgICAgICAgICAgICAgZm9yIHRyaWdnZXJOYW1lLCBhY3Rpb25Qcm9wcyBvZiBhY3Rpb25cbiAgICAgICAgICAgICAgICBpZiBFdmVudHNbdHJpZ2dlck5hbWVdXG4gICAgICAgICAgICAgICAgICBAW3RyaWdnZXJdLm9uIEV2ZW50c1t0cmlnZ2VyTmFtZV0sIGFjdGlvblByb3BzXG5cbiAgICAgIEAub24gRXZlbnRzLlN0YXRlU3dpdGNoU3RhcnQsIChmcm9tLCB0bykgLT5cbiAgICAgICAgZm9yIGNoaWxkIGluIEAuZGVzY2VuZGFudHNcbiAgICAgICAgICBpZiBjaGlsZC5jb25zdHJ1Y3Rvci5uYW1lID09IFwiVGV4dExheWVyXCJcbiAgICAgICAgICAgIGNoaWxkLnN0YXRlc1t0b10udGV4dCA9IGNoaWxkLnRleHRcbiAgICAgICAgICAgIGNoaWxkLnN0YXRlc1t0b10udGV4dEFsaWduID0gY2hpbGQucHJvcHMuc3R5bGVkVGV4dE9wdGlvbnMuYWxpZ25tZW50XG4gICAgICAgICAgICBjaGlsZC5zdGF0ZXNbdG9dLndpZHRoID0gY2hpbGQud2lkdGhcbiAgICAgICAgICAgIGNoaWxkLnN0YXRlc1t0b10uaGVpZ2h0ID0gY2hpbGQuaGVpZ2h0XG5cbiAgICAgICAgICAgIGlmIGNoaWxkLnRlbXBsYXRlICYmIE9iamVjdC5rZXlzKGNoaWxkLnRlbXBsYXRlKS5sZW5ndGggPiAwXG4gICAgICAgICAgICAgIGNoaWxkLnN0YXRlc1t0b10udGVtcGxhdGUgPSBjaGlsZC50ZW1wbGF0ZVxuXG4gICAgICAgICAgZWxzZVxuICAgICAgICAgICAgaWYgY2hpbGQuaW1hZ2UgJiYgKGNoaWxkLnN0YXRlc1t0b10uaW1hZ2UgIT0gY2hpbGQuaW1hZ2UpXG4gICAgICAgICAgICAgIGNoaWxkLnN0YXRlc1t0b10uaW1hZ2UgPSBjaGlsZC5pbWFnZVxuXG4gICAgICAgICAgY2hpbGQuYW5pbWF0ZSB0b1xuXG4gICAgbGF5ZXIuZGVzdHJveSgpXG5cbiMgQSBiYWNrdXAgZm9yIHRoZSBkZXByZWNhdGVkIHdheSBvZiBjYWxsaW5nIHRoZSBjbGFzc1xuZXhwb3J0cy5jcmVhdGVTeW1ib2wgPSAobGF5ZXIsIHN0YXRlcywgZXZlbnRzKSAtPiBleHBvcnRzLlN5bWJvbChsYXllciwgc3RhdGVzLCBldmVudHMpXG4iLCIjIEFkZCB0aGUgZm9sbG93aW5nIGxpbmUgdG8geW91ciBwcm9qZWN0IGluIEZyYW1lciBTdHVkaW8uXG4jIG15TW9kdWxlID0gcmVxdWlyZSBcIm15TW9kdWxlXCJcbiMgUmVmZXJlbmNlIHRoZSBjb250ZW50cyBieSBuYW1lLCBsaWtlIG15TW9kdWxlLm15RnVuY3Rpb24oKSBvciBteU1vZHVsZS5teVZhclxuXG5leHBvcnRzLm15VmFyID0gXCJteVZhcmlhYmxlXCJcblxuZXhwb3J0cy5teUZ1bmN0aW9uID0gLT5cblx0cHJpbnQgXCJteUZ1bmN0aW9uIGlzIHJ1bm5pbmdcIlxuXG5leHBvcnRzLm15QXJyYXkgPSBbMSwgMiwgM11cblxuXG5cbiMgZHVkZSA9IDQwXG4jIHRhYkNvdW50ID0gNFxuI1xuI1xuIyBleHBvcnRzLnRhYkJhck1vZHVsZSA9IC0+XG4jICAgdGFiQmFyQ29udGFpbmVyID0gbmV3IExheWVyXG4jICAgICBuYW1lOiBcInRhYkJhckNvbnRhaW5lclwiXG4jICAgICB3aWR0aDogU2NyZWVuLndpZHRoXG4jICAgICBoZWlnaHQ6IGR1ZGVcbiMgICAgIGJhY2tncm91bmRDb2xvcjogJ3BpbmsnXG4jICAgICB4OiBBbGlnbi5jZW50ZXIoKVxuIyAgICAgeTogQWxpZ24uYm90dG9tKClcbiNcbiMgICB0YWIgPSBuZXcgTGF5ZXJcbiMgICAgIHBhcmVudDogdGFiQmFyQ29udGFpbmVyXG4jICAgICB3aWR0aDogdGFiQmFyQ29udGFpbmVyLndpZHRoIC8gdGFiQ291bnRcbiMgICAgIGhlaWdodDogdGFiQmFyQ29udGFpbmVyLmhlaWdodFxuXG4jIGNsYXNzIEdob3N0TGF5ZXIgZXh0ZW5kcyBMYXllclxuIyBcdGNvbnN0cnVjdG9yOiAoQG9wdGlvbnM9e30pIC0+XG4jIFx0XHRAb3B0aW9ucy50cmFuc2x1Y2VudCA/PSBmYWxzZVxuIyBcdFx0c3VwZXIgQG9wdGlvbnNcbiMgXHRcdEAub25DbGljayBAZmFkZVxuI1xuIyBcdFx0aWYgQG9wdGlvbnMudHJhbnNsdWNlbnQgaXMgdHJ1ZVxuIyBcdFx0XHRALm9wYWNpdHkgPSAwLjVcbiNcbiMgXHRAZGVmaW5lICd0cmFuc2x1Y2VudCcsXG4jIFx0XHRnZXQ6IC0+XG4jIFx0XHRcdEBvcHRpb25zLnRyYW5zbHVjZW50XG4jIFx0XHRzZXQ6ICh2YWx1ZSkgLT5cbiMgXHRcdFx0QG9wdGlvbnMudHJhbnNsdWNlbnQgPSB2YWx1ZVxuIyBcdFx0XHRpZiBAb3B0aW9ucy50cmFuc2x1Y2VudCBpcyB0cnVlXG4jIFx0XHRcdFx0QC5vcGFjaXR5ID0gMC41XG4jIFx0XHRcdGVsc2VcbiMgXHRcdFx0XHRALm9wYWNpdHkgPSAxLjBcbiNcbiMgXHRmYWRlOiBVdGlscy5kZWJvdW5jZSAwLjUsIC0+XG4jIFx0XHRVdGlscy5kZWxheSAwLjUsID0+XG4jIFx0XHRcdGlmIEBvcHRpb25zLnRyYW5zbHVjZW50IGlzIHRydWVcbiMgXHRcdFx0XHRAb3B0aW9ucy50cmFuc2x1Y2VudCA9IGZhbHNlXG4jIFx0XHRcdFx0QC5hbmltYXRlXG4jIFx0XHRcdFx0XHRwcm9wZXJ0aWVzOlxuIyBcdFx0XHRcdFx0XHRvcGFjaXR5OiAxLjBcbiMgXHRcdFx0ZWxzZVxuIyBcdFx0XHRcdEBvcHRpb25zLnRyYW5zbHVjZW50ID0gdHJ1ZVxuIyBcdFx0XHRcdEAuYW5pbWF0ZVxuIyBcdFx0XHRcdFx0cHJvcGVydGllczpcbiMgXHRcdFx0XHRcdFx0b3BhY2l0eTogMC41XG4jXG4jIG1vZHVsZS5leHBvcnRzID0gR2hvc3RMYXllclxuXG5cbiMgdGFiQ291bnQgPSA0XG4jIHRhYkJhckhlaWdodCA9IDUwXG4jXG4jXG4jIGNsYXNzIER1ZGUgZXh0ZW5kcyBMYXllclxuIyAgICAgY29uc3RydWN0b3I6IChvcHRpb25zKSAtPlxuIyAgICAgICAgIHN1cGVyIF8uZGVmYXVsdHMgb3B0aW9ucyxcbiMgICAgICAgICAgIG5hbWU6IFwidGFiXCJcbiMgICAgICAgICAgIHdpZHRoOiAyMDBcbiMgICAgICAgICAgIGhlaWdodDogMzAwXG4jICAgICAgICAgICB4OiAyMDBcbiMgICAgICAgICAgIGJhY2tncm91bmRDb2xvcjogbnVsbFxuI1xuIyBleHBvcnRzLkR1ZGVcbiNcbiNcbiNcbiMgZXhwb3J0cy50YWJCYXJNb2R1bGUgPSAtPlxuIyAgIHRhYkJhckNvbnRhaW5lciA9IG5ldyBMYXllclxuIyAgICAgbmFtZTogXCJ0YWJCYXJDb250YWluZXJcIlxuIyAgICAgd2lkdGg6IFNjcmVlbi53aWR0aFxuIyAgICAgaGVpZ2h0OiB0YWJCYXJIZWlnaHRcbiMgICAgIGJhY2tncm91bmRDb2xvcjogJ3doaXRlJ1xuIyAgICAgeDogQWxpZ24uY2VudGVyKClcbiMgICAgIHk6IEFsaWduLmJvdHRvbSgpXG4jXG4jICAgZm9yIGkgaW4gWzAuLi50YWJDb3VudF1cbiMgICAgIHRhYiA9IG5ldyBUYWJcbiMgICAgICAgbmFtZTogXCJ0YWJcIlxuIyAgICAgICBwYXJlbnQ6IHRhYkJhckNvbnRhaW5lclxuIyAgICAgICB3aWR0aDogdGFiQmFyQ29udGFpbmVyLndpZHRoIC8gdGFiQ291bnRcbiMgICAgICAgaGVpZ2h0OiB0YWJCYXJDb250YWluZXIuaGVpZ2h0XG4jICAgICAgIHg6ICh0YWJCYXJDb250YWluZXIud2lkdGggLyB0YWJDb3VudCkgKiBpXG4jICAgICAgIGJhY2tncm91bmRDb2xvcjogbnVsbFxuI1xuIyAgICAgdGFiVGV4dCA9IG5ldyBUZXh0TGF5ZXJcbiMgICAgICAgbmFtZTogXCJUYWIgTGFiZWwgI3tpICsgMX1cIlxuIyAgICAgICBwYXJlbnQ6IHRhYlxuIyAgICAgICBmb250U2l6ZTogMTRcbiMgICAgICAgeDogQWxpZ24uY2VudGVyKClcbiMgICAgICAgeTogQWxpZ24uY2VudGVyKClcbiMgICAgICAgdGV4dDogXCJUYWJcIlxuIyAgICAgICBjb2xvcjogXCJibGFja1wiXG4jICAgICAgIGJhY2tncm91bmRDb2xvcjogbnVsbFxuXG5cblxuIyBjbGFzcyBUZXh0SW5wdXQgZXh0ZW5kcyBMYXllclxuIyBcdGNvbnN0cnVjdG9yOiAob3B0aW9ucykgLT5cbiMgXHRcdHN1cGVyIF8uZGVmYXVsdHMgb3B0aW9ucyxcbiMgXHRcdFx0eDogQWxpZ24uY2VudGVyKClcbiMgXHRcdFx0eTogQWxpZ24uYm90dG9tKClcbiMgXHRcdFx0d2lkdGg6IFNjcmVlbi53aWR0aFxuIyBcdFx0XHRoZWlnaHQ6IDYwXG4jIFx0XHRcdGJhY2tncm91bmRDb2xvcjogJ3doaXRlJ1xuI1xuI1xuI1xuIyBleHBvcnRzLlRleHRJbnB1dCA9IFRleHRJbnB1dFxuXG4jIGFiQ291bnQgPSA1XG4jXG4jXG4jIGNsYXNzIFRleHRJbnB1dCBleHRlbmRzIExheWVyXG4jICMgZXhwb3J0cy5UZXh0SW5wdXQgPSAtPlxuIyAgIHRhYkJhckNvbnRhaW5lciA9IG5ldyBMYXllclxuIyAgICAgeDogQWxpZ24uY2VudGVyKClcbiMgICAgIHk6IEFsaWduLmJvdHRvbSgpXG4jICAgICB3aWR0aDogU2NyZWVuLndpZHRoXG4jICAgICBoZWlnaHQ6IDYwXG4jICAgICBiYWNrZ3JvdW5kQ29sb3I6ICdncmVlbidcbiNcbiMgICBmb3IgaSBpbiBbMC4uLnRhYkNvdW50XVxuIyAgICAgdGFiID0gbmV3IExheWVyXG4jICAgICAgIG5hbWU6IFwidGFiXCJcbiMgICAgICAgcGFyZW50OiB0YWJCYXJDb250YWluZXJcbiMgICAgICAgd2lkdGg6IHRhYkJhckNvbnRhaW5lci53aWR0aCAvIHRhYkNvdW50XG4jICAgICAgIGhlaWdodDogdGFiQmFyQ29udGFpbmVyLmhlaWdodFxuIyAgICAgICB4OiAodGFiQmFyQ29udGFpbmVyLndpZHRoIC8gdGFiQ291bnQpICogaVxuIyAgICAgICBiYWNrZ3JvdW5kQ29sb3I6IG51bGxcbiNcbiMgICAgIHRhYlRleHQgPSBuZXcgVGV4dExheWVyXG4jICAgICAgIG5hbWU6IFwiVGFiIExhYmVsICN7aSArIDF9XCJcbiMgICAgICAgcGFyZW50OiB0YWJcbiMgICAgICAgZm9udFNpemU6IDE0XG4jICAgICAgIHg6IEFsaWduLmNlbnRlcigpXG4jICAgICAgIHk6IEFsaWduLmNlbnRlcigpXG4jICAgICAgIHRleHQ6IFwiVGFiXCJcbiMgICAgICAgY29sb3I6IFwiYmxhY2tcIlxuIyAgICAgICBiYWNrZ3JvdW5kQ29sb3I6IG51bGxcbiNcbiMgZXhwb3J0cy5UZXh0SW5wdXQgPSBUZXh0SW5wdXRcbiIsIlxuXG5jbGFzcyBUZXh0SW5wdXQgZXh0ZW5kcyBMYXllclxuICAgIGNvbnN0cnVjdG9yOiAob3B0aW9ucykgLT5cbiAgICAgICAgc3VwZXIgXy5kZWZhdWx0cyBvcHRpb25zLFxuICAgICAgICAgIHg6IEFsaWduLmNlbnRlcigpXG4gICAgICAgICAgeTogQWxpZ24uYm90dG9tKClcbiAgICAgICAgICB3aWR0aDogU2NyZWVuLndpZHRoXG4gICAgICAgICAgaGVpZ2h0OiA2MFxuICAgICAgICAgIGJhY2tncm91bmRDb2xvcjogJ2dyZWVuJ1xuXG5cbiAgICBzZXR1cExheWVyOiAoTGF5ZXIpIC0+XG4gICAgICBsYXllci5wYXJlbnQgPSB0aGlzXG4gICAgICBsYXllci5oZWlnaHQgPSAzMFxuICAgICAgbGF5ZXIud2lkdGggPSA0MFxuICAgICAgbGF5ZXIuYmFja2dyb3VuZENvbG9yID0gJ3BpbmsnXG5cblxuXG5cbiAgICAjIGR1ZGUgPSBuZXcgc3ViTGF5ZXJcbiAgICAgICMgaGVpZ2h0OiAxMDBcbiAgICAgICMgd2lkdGg6IDEwMFxuICAgICAgIyBiYWNrZ3JvdW5kQ29sb3I6ICdwaW5rJ1xuXG5leHBvcnRzLlRleHRJbnB1dCA9IFRleHRJbnB1dFxuIiwiKGZ1bmN0aW9uIGUodCxuLHIpe2Z1bmN0aW9uIHMobyx1KXtpZighbltvXSl7aWYoIXRbb10pe3ZhciBhPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7aWYoIXUmJmEpcmV0dXJuIGEobywhMCk7aWYoaSlyZXR1cm4gaShvLCEwKTt2YXIgZj1uZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK28rXCInXCIpO3Rocm93IGYuY29kZT1cIk1PRFVMRV9OT1RfRk9VTkRcIixmfXZhciBsPW5bb109e2V4cG9ydHM6e319O3Rbb11bMF0uY2FsbChsLmV4cG9ydHMsZnVuY3Rpb24oZSl7dmFyIG49dFtvXVsxXVtlXTtyZXR1cm4gcyhuP246ZSl9LGwsbC5leHBvcnRzLGUsdCxuLHIpfXJldHVybiBuW29dLmV4cG9ydHN9dmFyIGk9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtmb3IodmFyIG89MDtvPHIubGVuZ3RoO28rKylzKHJbb10pO3JldHVybiBzfSkiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFHQUE7QURFQSxJQUFBLFNBQUE7RUFBQTs7O0FBQU07OztFQUNXLG1CQUFDLE9BQUQ7SUFDVCwyQ0FBTSxDQUFDLENBQUMsUUFBRixDQUFXLE9BQVgsRUFDSjtNQUFBLENBQUEsRUFBRyxLQUFLLENBQUMsTUFBTixDQUFBLENBQUg7TUFDQSxDQUFBLEVBQUcsS0FBSyxDQUFD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

require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}],"rubberDuck":[function(require,module,exports){
exports.test = function() {
  return new Layer({
    width: 400,
    height: 400,
    backgroundColor: 'pink'
  });
};


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
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL21hbmhhcnQvRG9jdW1lbnRzLzAyX0Rldi9mcmFtZXItc2tldGNoYm9vay9GbG93LTAxLmZyYW1lci9tb2R1bGVzL3N5bWJvbHMvU3ltYm9sLmNvZmZlZSIsIi4uLy4uLy4uLy4uLy4uL1VzZXJzL21hbmhhcnQvRG9jdW1lbnRzLzAyX0Rldi9mcmFtZXItc2tldGNoYm9vay9GbG93LTAxLmZyYW1lci9tb2R1bGVzL3J1YmJlckR1Y2suY29mZmVlIiwiLi4vLi4vLi4vLi4vLi4vVXNlcnMvbWFuaGFydC9Eb2N1bWVudHMvMDJfRGV2L2ZyYW1lci1za2V0Y2hib29rL0Zsb3ctMDEuZnJhbWVyL21vZHVsZXMvbXlNb2R1bGUuY29mZmVlIiwibm9kZV9tb2R1bGVzL2Jyb3dzZXItcGFjay9fcHJlbHVkZS5qcyJdLCJzb3VyY2VzQ29udGVudCI6WyJjb3B5U291cmNlVG9UYXJnZXQgPSAoc291cmNlLCB0YXJnZXQ9ZmFsc2UpIC0+XG4gIGlmIHNvdXJjZS5jaGlsZHJlbi5sZW5ndGggPiAwXG4gICAgZm9yIHN1YkxheWVyIGluIHNvdXJjZS5kZXNjZW5kYW50c1xuICAgICAgdGFyZ2V0W3N1YkxheWVyLm5hbWVdID0gc3ViTGF5ZXIuY29weVNpbmdsZSgpXG4gICAgICB0YXJnZXRbc3ViTGF5ZXIubmFtZV0ubmFtZSA9IHN1YkxheWVyLm5hbWVcblxuICAgICAgaWYgc3ViTGF5ZXIucGFyZW50IGlzIHNvdXJjZVxuICAgICAgICB0YXJnZXRbc3ViTGF5ZXIubmFtZV0ucGFyZW50ID0gdGFyZ2V0XG4gICAgICBlbHNlXG4gICAgICAgIHRhcmdldFtzdWJMYXllci5uYW1lXS5wYXJlbnQgPSB0YXJnZXRbc3ViTGF5ZXIucGFyZW50Lm5hbWVdXG5cbmNvcHlTdGF0ZXNGcm9tVGFyZ2V0ID0gKHNvdXJjZSwgdGFyZ2V0LCBzdGF0ZU5hbWUsIGFuaW1hdGlvbk9wdGlvbnM9ZmFsc2UpIC0+XG4gIHRhcmdldHMgPSBbXVxuXG4gIGZvciBsYXllciBpbiB0YXJnZXQuZGVzY2VuZGFudHNcbiAgICB0YXJnZXRzW2xheWVyLm5hbWVdID0gbGF5ZXJcblxuICBmb3Igc3ViTGF5ZXIgaW4gc291cmNlLmRlc2NlbmRhbnRzXG4gICAgc3ViTGF5ZXIuc3RhdGVzW1wiI3tzdGF0ZU5hbWV9XCJdID0gdGFyZ2V0c1tzdWJMYXllci5uYW1lXS5zdGF0ZXNbXCJkZWZhdWx0XCJdXG5cbiAgICBpZiBhbmltYXRpb25PcHRpb25zXG4gICAgICBzdWJMYXllci5zdGF0ZXNbXCIje3N0YXRlTmFtZX1cIl0uYW5pbWF0aW9uT3B0aW9ucyA9IGFuaW1hdGlvbk9wdGlvbnNcblxuTGF5ZXI6OmFkZFN5bWJvbFN0YXRlID0gKHN0YXRlTmFtZSwgdGFyZ2V0LCBhbmltYXRpb25PcHRpb25zPWZhbHNlKSAtPlxuICBALnN0YXRlc1tcIiN7c3RhdGVOYW1lfVwiXSA9XG4gICAgICB3aWR0aDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0ud2lkdGhcbiAgICAgIGhlaWdodDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uaGVpZ2h0XG4gICAgICB2aXNpYmxlOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS52aXNpYmxlXG4gICAgICBvcGFjaXR5OiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5vcGFjaXR5XG4gICAgICBjbGlwOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5jbGlwXG4gICAgICBzY3JvbGxIb3Jpem9udGFsOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5zY3JvbGxIb3Jpem9udGFsXG4gICAgICBzY3JvbGxWZXJ0aWNhbDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uc2Nyb2xsVmVydGljYWxcbiAgICAgIHNjcm9sbDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uc2Nyb2xsXG4gICAgICBzY2FsZVg6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnNjYWxlWFxuICAgICAgc2NhbGVZOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5zY2FsZVlcbiAgICAgIHNjYWxlWjogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uc2NhbGVaXG4gICAgICBzY2FsZTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uc2NhbGVcbiAgICAgIHNrZXdYOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5za2V3WFxuICAgICAgc2tld1k6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnNrZXdZXG4gICAgICBza2V3OiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5za2V3XG4gICAgICBvcmlnaW5YOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5vcmlnaW5YXG4gICAgICBvcmlnaW5ZOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5vcmlnaW5ZXG4gICAgICBvcmlnaW5aOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5vcmlnaW5aXG4gICAgICBwZXJzcGVjdGl2ZTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0ucGVyc3BlY3RpdmVcbiAgICAgIHBlcnNwZWN0aXZlT3JpZ2luWDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0ucGVyc3BlY3RpdmVPcmlnaW5YXG4gICAgICBwZXJzcGVjdGl2ZU9yaWdpblk6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnBlcnNwZWN0aXZlT3JpZ2luWVxuICAgICAgcm90YXRpb25YOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5yb3RhdGlvblhcbiAgICAgIHJvdGF0aW9uWTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0ucm90YXRpb25ZXG4gICAgICByb3RhdGlvblo6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnJvdGF0aW9uWlxuICAgICAgcm90YXRpb246IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnJvdGF0aW9uXG4gICAgICBibHVyOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5ibHVyXG4gICAgICBicmlnaHRuZXNzOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5icmlnaHRuZXNzXG4gICAgICBzYXR1cmF0ZTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uc2F0dXJhdGVcbiAgICAgIGh1ZVJvdGF0ZTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uaHVlUm90YXRlXG4gICAgICBjb250cmFzdDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uY29udHJhc3RcbiAgICAgIGludmVydDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uaW52ZXJ0XG4gICAgICBncmF5c2NhbGU6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmdyYXlzY2FsZVxuICAgICAgc2VwaWE6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnNlcGlhXG4gICAgICBibGVuZGluZzogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uYmxlbmRpbmdcbiAgICAgIGJhY2tncm91bmRCbHVyOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5iYWNrZ3JvdW5kQmx1clxuICAgICAgYmFja2dyb3VuZEJyaWdodG5lc3M6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmJhY2tncm91bmRCcmlnaHRuZXNzXG4gICAgICBiYWNrZ3JvdW5kU2F0dXJhdGU6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmJhY2tncm91bmRTYXR1cmF0ZVxuICAgICAgYmFja2dyb3VuZEh1ZVJvdGF0ZTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uYmFja2dyb3VuZEh1ZVJvdGF0ZVxuICAgICAgYmFja2dyb3VuZENvbnRyYXN0OiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5iYWNrZ3JvdW5kQ29udHJhc3RcbiAgICAgIGJhY2tncm91bmRJbnZlcnQ6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmJhY2tncm91bmRJbnZlcnRcbiAgICAgIGJhY2tncm91bmRHcmF5c2NhbGU6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmJhY2tncm91bmRHcmF5c2NhbGVcbiAgICAgIGJhY2tncm91bmRTZXBpYTogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uYmFja2dyb3VuZFNlcGlhXG4gICAgICBzaGFkb3dzOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5zaGFkb3dzXG4gICAgICBiYWNrZ3JvdW5kQ29sb3I6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmJhY2tncm91bmRDb2xvclxuICAgICAgY29sb3I6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmNvbG9yXG4gICAgICBib3JkZXJSYWRpdXM6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmJvcmRlclJhZGl1c1xuICAgICAgYm9yZGVyQ29sb3I6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmJvcmRlckNvbG9yXG4gICAgICBib3JkZXJXaWR0aDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uYm9yZGVyV2lkdGhcbiAgICAgIGJvcmRlclN0eWxlOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5ib3JkZXJTdHlsZVxuICAgICAgZm9yY2UyZDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uZm9yY2UyZFxuICAgICAgZmxhdDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uZmxhdFxuICAgICAgYmFja2ZhY2VWaXNpYmxlOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5iYWNrZmFjZVZpc2libGVcbiAgICAgIGh0bWxJbnRyaW5zaWNTaXplOiB0YXJnZXQuc3RhdGVzW1wiZGVmYXVsdFwiXS5odG1sSW50cmluc2ljU2l6ZVxuICAgICAgaHRtbDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uaHRtbFxuICAgICAgaW1hZ2U6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLmltYWdlXG4gICAgICBncmFkaWVudDogdGFyZ2V0LnN0YXRlc1tcImRlZmF1bHRcIl0uZ3JhZGllbnRcbiAgICAgIHNjcm9sbFg6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnNjcm9sbFhcbiAgICAgIHNjcm9sbFk6IHRhcmdldC5zdGF0ZXNbXCJkZWZhdWx0XCJdLnNjcm9sbFlcblxuICBpZiBhbmltYXRpb25PcHRpb25zXG4gICAgQC5zdGF0ZXNbXCIje3N0YXRlTmFtZX1cIl0uYW5pbWF0aW9uT3B0aW9ucyA9IGFuaW1hdGlvbk9wdGlvbnNcblxuICBjb3B5U3RhdGVzRnJvbVRhcmdldChALCB0YXJnZXQsIHN0YXRlTmFtZSwgYW5pbWF0aW9uT3B0aW9ucylcbiAgdGFyZ2V0LmRlc3Ryb3koKVxuXG5MYXllcjo6cmVwbGFjZVdpdGhTeW1ib2wgPSAoc3ltYm9sKSAtPlxuICBzeW1ib2wucG9pbnQgPSBALnBvaW50XG4gIHN5bWJvbC5wYXJlbnQgPSBALnBhcmVudFxuXG4gIGZvciBzdGF0ZU5hbWUgaW4gc3ltYm9sLnN0YXRlTmFtZXNcbiAgICBzeW1ib2wuc3RhdGVzW1wiI3tzdGF0ZU5hbWV9XCJdLnBvaW50ID0gQC5wb2ludFxuICBALmRlc3Ryb3koKVxuXG5leHBvcnRzLlN5bWJvbCA9IChsYXllciwgc3RhdGVzPWZhbHNlLCBldmVudHM9ZmFsc2UpIC0+XG4gIGNsYXNzIFN5bWJvbCBleHRlbmRzIExheWVyXG4gICAgY29uc3RydWN0b3I6IChAb3B0aW9ucz17fSkgLT5cbiAgICAgIEBvcHRpb25zLndpZHRoID89IGxheWVyLndpZHRoXG4gICAgICBAb3B0aW9ucy5oZWlnaHQgPz0gbGF5ZXIuaGVpZ2h0XG4gICAgICBAb3B0aW9ucy52aXNpYmxlID89IGxheWVyLnZpc2libGVcbiAgICAgIEBvcHRpb25zLm9wYWNpdHkgPz0gbGF5ZXIub3BhY2l0eVxuICAgICAgQG9wdGlvbnMuY2xpcCA/PSBsYXllci5jbGlwXG4gICAgICBAb3B0aW9ucy5zY3JvbGxIb3Jpem9udGFsID89IGxheWVyLnNjcm9sbEhvcml6b250YWxcbiAgICAgIEBvcHRpb25zLnNjcm9sbFZlcnRpY2FsID89IGxheWVyLnNjcm9sbFZlcnRpY2FsXG4gICAgICBAb3B0aW9ucy5zY3JvbGwgPz0gbGF5ZXIuc2Nyb2xsXG4gICAgICBAb3B0aW9ucy54ID89IGxheWVyLnhcbiAgICAgIEBvcHRpb25zLnkgPz0gbGF5ZXIueVxuICAgICAgQG9wdGlvbnMueiA/PSBsYXllci56XG4gICAgICBAb3B0aW9ucy5zY2FsZVggPz0gbGF5ZXIuc2NhbGVYXG4gICAgICBAb3B0aW9ucy5zY2FsZVkgPz0gbGF5ZXIuc2NhbGVZXG4gICAgICBAb3B0aW9ucy5zY2FsZVogPz0gbGF5ZXIuc2NhbGVaXG4gICAgICBAb3B0aW9ucy5zY2FsZSA/PSBsYXllci5zY2FsZVxuICAgICAgQG9wdGlvbnMuc2tld1ggPz0gbGF5ZXIuc2tld1hcbiAgICAgIEBvcHRpb25zLnNrZXdZID89IGxheWVyLnNrZXdZXG4gICAgICBAb3B0aW9ucy5za2V3ID89IGxheWVyLnNrZXdcbiAgICAgIEBvcHRpb25zLm9yaWdpblggPz0gbGF5ZXIub3JpZ2luWFxuICAgICAgQG9wdGlvbnMub3JpZ2luWSA/PSBsYXllci5vcmlnaW5ZXG4gICAgICBAb3B0aW9ucy5vcmlnaW5aID89IGxheWVyLm9yaWdpblpcbiAgICAgIEBvcHRpb25zLnBlcnNwZWN0aXZlID89IGxheWVyLnBlcnNwZWN0aXZlXG4gICAgICBAb3B0aW9ucy5wZXJzcGVjdGl2ZU9yaWdpblggPz0gbGF5ZXIucGVyc3BlY3RpdmVPcmlnaW5YXG4gICAgICBAb3B0aW9ucy5wZXJzcGVjdGl2ZU9yaWdpblkgPz0gbGF5ZXIucGVyc3BlY3RpdmVPcmlnaW5ZXG4gICAgICBAb3B0aW9ucy5yb3RhdGlvblggPz0gbGF5ZXIucm90YXRpb25YXG4gICAgICBAb3B0aW9ucy5yb3RhdGlvblkgPz0gbGF5ZXIucm90YXRpb25ZXG4gICAgICBAb3B0aW9ucy5yb3RhdGlvblogPz0gbGF5ZXIucm90YXRpb25aXG4gICAgICBAb3B0aW9ucy5yb3RhdGlvbiA/PSBsYXllci5yb3RhdGlvblxuICAgICAgQG9wdGlvbnMuYmx1ciA/PSBsYXllci5ibHVyXG4gICAgICBAb3B0aW9ucy5icmlnaHRuZXNzID89IGxheWVyLmJyaWdodG5lc3NcbiAgICAgIEBvcHRpb25zLnNhdHVyYXRlID89IGxheWVyLnNhdHVyYXRlXG4gICAgICBAb3B0aW9ucy5odWVSb3RhdGUgPz0gbGF5ZXIuaHVlUm90YXRlXG4gICAgICBAb3B0aW9ucy5jb250cmFzdCA/PSBsYXllci5jb250cmFzdFxuICAgICAgQG9wdGlvbnMuaW52ZXJ0ID89IGxheWVyLmludmVydFxuICAgICAgQG9wdGlvbnMuZ3JheXNjYWxlID89IGxheWVyLmdyYXlzY2FsZVxuICAgICAgQG9wdGlvbnMuc2VwaWEgPz0gbGF5ZXIuc2VwaWFcbiAgICAgIEBvcHRpb25zLmJsZW5kaW5nID89IGxheWVyLmJsZW5kaW5nXG4gICAgICBAb3B0aW9ucy5iYWNrZ3JvdW5kQmx1ciA/PSBsYXllci5iYWNrZ3JvdW5kQmx1clxuICAgICAgQG9wdGlvbnMuYmFja2dyb3VuZEJyaWdodG5lc3MgPz0gbGF5ZXIuYmFja2dyb3VuZEJyaWdodG5lc3NcbiAgICAgIEBvcHRpb25zLmJhY2tncm91bmRTYXR1cmF0ZSA/PSBsYXllci5iYWNrZ3JvdW5kU2F0dXJhdGVcbiAgICAgIEBvcHRpb25zLmJhY2tncm91bmRIdWVSb3RhdGUgPz0gbGF5ZXIuYmFja2dyb3VuZEh1ZVJvdGF0ZVxuICAgICAgQG9wdGlvbnMuYmFja2dyb3VuZENvbnRyYXN0ID89IGxheWVyLmJhY2tncm91bmRDb250cmFzdFxuICAgICAgQG9wdGlvbnMuYmFja2dyb3VuZEludmVydCA/PSBsYXllci5iYWNrZ3JvdW5kSW52ZXJ0XG4gICAgICBAb3B0aW9ucy5iYWNrZ3JvdW5kR3JheXNjYWxlID89IGxheWVyLmJhY2tncm91bmRHcmF5c2NhbGVcbiAgICAgIEBvcHRpb25zLmJhY2tncm91bmRTZXBpYSA/PSBsYXllci5iYWNrZ3JvdW5kU2VwaWFcbiAgICAgIEBvcHRpb25zLnNoYWRvd3MgPz0gbGF5ZXIuc2hhZG93c1xuICAgICAgQG9wdGlvbnMuYmFja2dyb3VuZENvbG9yID89IGxheWVyLmJhY2tncm91bmRDb2xvclxuICAgICAgQG9wdGlvbnMuY29sb3IgPz0gbGF5ZXIuY29sb3JcbiAgICAgIEBvcHRpb25zLmJvcmRlclJhZGl1cyA/PSBsYXllci5ib3JkZXJSYWRpdXNcbiAgICAgIEBvcHRpb25zLmJvcmRlckNvbG9yID89IGxheWVyLmJvcmRlckNvbG9yXG4gICAgICBAb3B0aW9ucy5ib3JkZXJXaWR0aCA/PSBsYXllci5ib3JkZXJXaWR0aFxuICAgICAgQG9wdGlvbnMuYm9yZGVyU3R5bGUgPz0gbGF5ZXIuYm9yZGVyU3R5bGVcbiAgICAgIEBvcHRpb25zLmZvcmNlMmQgPz0gbGF5ZXIuZm9yY2UyZFxuICAgICAgQG9wdGlvbnMuZmxhdCA/PSBsYXllci5mbGF0XG4gICAgICBAb3B0aW9ucy5iYWNrZmFjZVZpc2libGUgPz0gbGF5ZXIuYmFja2ZhY2VWaXNpYmxlXG4gICAgICBAb3B0aW9ucy5odG1sSW50cmluc2ljU2l6ZSA/PSBsYXllci5odG1sSW50cmluc2ljU2l6ZVxuICAgICAgQG9wdGlvbnMuaHRtbCA/PSBsYXllci5odG1sXG4gICAgICBAb3B0aW9ucy5pbWFnZSA/PSBsYXllci5pbWFnZVxuICAgICAgQG9wdGlvbnMuZ3JhZGllbnQgPz0gbGF5ZXIuZ3JhZGllbnRcbiAgICAgIEBvcHRpb25zLnNjcm9sbFggPz0gbGF5ZXIuc2Nyb2xsWFxuICAgICAgQG9wdGlvbnMuc2Nyb2xsWSA/PSBsYXllci5zY3JvbGxZXG5cbiAgICAgIEBvcHRpb25zLnggPz0gZmFsc2VcbiAgICAgIEBvcHRpb25zLnkgPz0gZmFsc2VcblxuICAgICAgc3VwZXIgQG9wdGlvbnNcblxuICAgICAgQC5jdXN0b21Qcm9wcyA9IEBvcHRpb25zLmN1c3RvbVByb3BzXG5cbiAgICAgIEAuc3RhdGVzWydkZWZhdWx0J10ueCA9IEAueFxuICAgICAgQC5zdGF0ZXNbJ2RlZmF1bHQnXS55ID0gQC55XG5cbiAgICAgIGNvcHlTb3VyY2VUb1RhcmdldChsYXllciwgQClcblxuICAgICAgaWYgc3RhdGVzXG4gICAgICAgIGZvciBzdGF0ZU5hbWUsIHN0YXRlUHJvcHMgb2Ygc3RhdGVzXG4gICAgICAgICAgQC5hZGRTeW1ib2xTdGF0ZShzdGF0ZU5hbWUsIHN0YXRlUHJvcHMudGVtcGxhdGUsIHN0YXRlUHJvcHMuYW5pbWF0aW9uT3B0aW9ucylcblxuICAgICAgaWYgZXZlbnRzXG4gICAgICAgIGZvciB0cmlnZ2VyLCBhY3Rpb24gb2YgZXZlbnRzXG4gICAgICAgICAgaWYgXy5pc0Z1bmN0aW9uKGFjdGlvbilcbiAgICAgICAgICAgIGlmIEV2ZW50c1t0cmlnZ2VyXVxuICAgICAgICAgICAgICBAb24gRXZlbnRzW3RyaWdnZXJdLCBhY3Rpb25cbiAgICAgICAgICBlbHNlXG4gICAgICAgICAgICBpZiBAW3RyaWdnZXJdXG4gICAgICAgICAgICAgIGZvciB0cmlnZ2VyTmFtZSwgYWN0aW9uUHJvcHMgb2YgYWN0aW9uXG4gICAgICAgICAgICAgICAgaWYgRXZlbnRzW3RyaWdnZXJOYW1lXVxuICAgICAgICAgICAgICAgICAgQFt0cmlnZ2VyXS5vbiBFdmVudHNbdHJpZ2dlck5hbWVdLCBhY3Rpb25Qcm9wc1xuXG4gICAgICBALm9uIEV2ZW50cy5TdGF0ZVN3aXRjaFN0YXJ0LCAoZnJvbSwgdG8pIC0+XG4gICAgICAgIGZvciBjaGlsZCBpbiBALmRlc2NlbmRhbnRzXG4gICAgICAgICAgaWYgY2hpbGQuY29uc3RydWN0b3IubmFtZSA9PSBcIlRleHRMYXllclwiXG4gICAgICAgICAgICBjaGlsZC5zdGF0ZXNbdG9dLnRleHQgPSBjaGlsZC50ZXh0XG4gICAgICAgICAgICBjaGlsZC5zdGF0ZXNbdG9dLnRleHRBbGlnbiA9IGNoaWxkLnByb3BzLnN0eWxlZFRleHRPcHRpb25zLmFsaWdubWVudFxuICAgICAgICAgICAgY2hpbGQuc3RhdGVzW3RvXS53aWR0aCA9IGNoaWxkLndpZHRoXG4gICAgICAgICAgICBjaGlsZC5zdGF0ZXNbdG9dLmhlaWdodCA9IGNoaWxkLmhlaWdodFxuXG4gICAgICAgICAgICBpZiBjaGlsZC50ZW1wbGF0ZSAmJiBPYmplY3Qua2V5cyhjaGlsZC50ZW1wbGF0ZSkubGVuZ3RoID4gMFxuICAgICAgICAgICAgICBjaGlsZC5zdGF0ZXNbdG9dLnRlbXBsYXRlID0gY2hpbGQudGVtcGxhdGVcblxuICAgICAgICAgIGVsc2VcbiAgICAgICAgICAgIGlmIGNoaWxkLmltYWdlICYmIChjaGlsZC5zdGF0ZXNbdG9dLmltYWdlICE9IGNoaWxkLmltYWdlKVxuICAgICAgICAgICAgICBjaGlsZC5zdGF0ZXNbdG9dLmltYWdlID0gY2hpbGQuaW1hZ2VcblxuICAgICAgICAgIGNoaWxkLmFuaW1hdGUgdG9cblxuICAgIGxheWVyLmRlc3Ryb3koKVxuXG4jIEEgYmFja3VwIGZvciB0aGUgZGVwcmVjYXRlZCB3YXkgb2YgY2FsbGluZyB0aGUgY2xhc3NcbmV4cG9ydHMuY3JlYXRlU3ltYm9sID0gKGxheWVyLCBzdGF0ZXMsIGV2ZW50cykgLT4gZXhwb3J0cy5TeW1ib2wobGF5ZXIsIHN0YXRlcywgZXZlbnRzKVxuIiwiXG5cblxuZXhwb3J0cy50ZXN0ID0gLT5cbiAgbmV3IExheWVyXG4gICAgd2lkdGg6IDQwMFxuICAgIGhlaWdodDogNDAwXG4gICAgYmFja2dyb3VuZENvbG9yOiAncGluayciLCIjIEFkZCB0aGUgZm9sbG93aW5nIGxpbmUgdG8geW91ciBwcm9qZWN0IGluIEZyYW1lciBTdHVkaW8uIFxuIyBteU1vZHVsZSA9IHJlcXVpcmUgXCJteU1vZHVsZVwiXG4jIFJlZmVyZW5jZSB0aGUgY29udGVudHMgYnkgbmFtZSwgbGlrZSBteU1vZHVsZS5teUZ1bmN0aW9uKCkgb3IgbXlNb2R1bGUubXlWYXJcblxuZXhwb3J0cy5teVZhciA9IFwibXlWYXJpYWJsZVwiXG5cbmV4cG9ydHMubXlGdW5jdGlvbiA9IC0+XG5cdHByaW50IFwibXlGdW5jdGlvbiBpcyBydW5uaW5nXCJcblxuZXhwb3J0cy5teUFycmF5ID0gWzEsIDIsIDNdIiwiKGZ1bmN0aW9uIGUodCxuLHIpe2Z1bmN0aW9uIHMobyx1KXtpZighbltvXSl7aWYoIXRbb10pe3ZhciBhPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7aWYoIXUmJmEpcmV0dXJuIGEobywhMCk7aWYoaSlyZXR1cm4gaShvLCEwKTt2YXIgZj1uZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK28rXCInXCIpO3Rocm93IGYuY29kZT1cIk1PRFVMRV9OT1RfRk9VTkRcIixmfXZhciBsPW5bb109e2V4cG9ydHM6e319O3Rbb11bMF0uY2FsbChsLmV4cG9ydHMsZnVuY3Rpb24oZSl7dmFyIG49dFtvXVsxXVtlXTtyZXR1cm4gcyhuP246ZSl9LGwsbC5leHBvcnRzLGUsdCxuLHIpfXJldHVybiBuW29dLmV4cG9ydHN9dmFyIGk9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtmb3IodmFyIG89MDtvPHIubGVuZ3RoO28rKylzKHJbb10pO3JldHVybiBzfSkiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFHQUE7QURJQSxPQUFPLENBQUMsS0FBUixHQUFnQjs7QUFFaEIsT0FBTyxDQUFDLFVBQVIsR0FBcUIsU0FBQTtTQUNwQixLQUFBLENBQU0sdUJBQU47QUFEb0I7O0FBR3JCLE9BQU8sQ0FBQyxPQUFSLEdBQWtCLENBQUMsQ0FBRCxFQUFJLENBQUosRUFBTyxDQUFQOzs7O0FETmxCLE9BQU8sQ0FBQyxJQUFSLEdBQWUsU0FBQTtTQUNULElBQUEsS0FBQSxDQUNGO0lBQUEsS0FBQSxFQUFPLEdBQVA7SUFDQSxNQUFBLEVBQVEsR0FEUjtJQUVBLGVBQUEsRUFBaUIsTUFGakI7R0FERTtBQURTOzs7O0FESGYsSUFBQSx3Q0FBQTtFQUFBOzs7QUFBQSxrQkFBQSxHQUFxQixTQUFDLE1BQUQsRUFBUyxNQUFUO0FBQ25CLE1BQUE7O0lBRDRCLFNBQU87O0VBQ25DLElBQUcsTUFBTSxDQUFDLFFBQVEsQ0FBQyxNQUFoQixHQUF5QixDQUE1QjtBQUNFO0FBQUE7U0FBQSxxQ0FBQTs7TUFDRSxNQUFPLENB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

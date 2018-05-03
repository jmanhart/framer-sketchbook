require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"LottieLayer":[function(require,module,exports){

/*
LottieLayer
-
Implementation of Hernan Torrisi & AirBnb "Lottie-Web" for Framer.
by @72mena
 */
var insertScript,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

insertScript = function(localScript, webScript, name) {
  var e, head, lib, script;
  if (name == null) {
    name = 'JavaScript Library';
  }
  try {
    lib = Utils.domLoadDataSync(localScript);
    console.log("%c" + name + " Successfully Included Locally", "background: #DDFFE3; color: #007814");
  } catch (error) {
    e = error;
    try {
      lib = Utils.domLoadDataSync(webScript);
      console.log("%c" + name + " Successfully Included from Web", "background: #DDFFE3; color: #007814");
    } catch (error) {
      e = error;
      throw Error("Sorry, I couldn't load " + name);
    }
  }
  script = document.createElement("script");
  script.type = "text/javascript";
  script.innerHTML = lib;
  head = document.getElementsByTagName("head")[0];
  head.appendChild(script);
  return script;
};

insertScript("modules/lottie.min.js", "https://raw.githubusercontent.com/airbnb/lottie-web/master/build/player/lottie.min.js", "lottie-web");

exports.LottieLayer = (function(superClass) {
  extend(LottieLayer, superClass);

  LottieLayer.define("speed", {
    get: function() {
      return this._properties["speed"];
    },
    set: function(value) {
      this._properties["speed"] = value;
      if (this.built) {
        this.setSpeed(value);
      }
      return this.emit("change:speed");
    }
  });

  LottieLayer.define("direction", {
    get: function() {
      return this._properties["direction"];
    },
    set: function(value) {
      this._properties["direction"] = value;
      if (this.built) {
        this.setDirection(value);
      }
      return this.emit("change:direction");
    }
  });

  LottieLayer.define("path", {
    get: function() {
      return this._properties["path"];
    },
    set: function(value) {
      this._properties["path"] = value;
      if (this.built) {
        this.setSettings();
      }
      return this.emit("change:path");
    }
  });

  function LottieLayer(options) {
    var base, base1, base2, base3, base4, base5, base6;
    this.options = options != null ? options : {};
    if ((base = this.options).backgroundColor == null) {
      base.backgroundColor = null;
    }
    if ((base1 = this.options).path == null) {
      base1.path = null;
    }
    if ((base2 = this.options).autoplay == null) {
      base2.autoplay = true;
    }
    if ((base3 = this.options).loop == null) {
      base3.loop = true;
    }
    if ((base4 = this.options).speed == null) {
      base4.speed = 1;
    }
    if ((base5 = this.options).direction == null) {
      base5.direction = 1;
    }
    if ((base6 = this.options).renderer == null) {
      base6.renderer = "svg";
    }
    LottieLayer.__super__.constructor.call(this, this.options);
    if (this.options.path === null) {
      print("From LottieLayer: Setting a path to your json file is required.");
    }
    if (this.name === "") {
      print("From LottieLayer: The 'name' attribute is required.");
    }
    this.autoplay = this.options.autoplay;
    this.loop = this.options.loop;
    this.renderer = this.options.renderer;
    this.built = false;
    this._animationLayer = null;
    this.build();
  }

  LottieLayer.prototype.build = function() {
    this.html = '<div id=' + ("" + this.name) + '></div>';
    this.setSettings();
    return this.built = true;
  };

  LottieLayer.prototype.setSettings = function() {
    var _container, lottieSettings;
    _container = document.getElementById(this.name);
    _container.innerHTML = "";
    lottieSettings = {
      container: _container,
      path: this.path,
      renderer: this.renderer,
      autoplay: this.autoplay,
      loop: this.loop
    };
    this._animationLayer = lottie.loadAnimation(lottieSettings);
    this.setSpeed();
    return this.setDirection();
  };

  LottieLayer.prototype.play = function() {
    return this._animationLayer.play();
  };

  LottieLayer.prototype.stop = function() {
    return this._animationLayer.stop();
  };

  LottieLayer.prototype.pause = function() {
    return this._animationLayer.pause();
  };

  LottieLayer.prototype.goToAndPlay = function(value, isFrame) {
    if (isFrame == null) {
      isFrame = true;
    }
    return this._animationLayer.goToAndPlay(value, isFrame);
  };

  LottieLayer.prototype.goToAndStop = function(value, isFrame) {
    if (isFrame == null) {
      isFrame = true;
    }
    return this._animationLayer.goToAndStop(value, isFrame);
  };

  LottieLayer.prototype.playSegments = function(segments, forceFlag) {
    if (forceFlag == null) {
      forceFlag = true;
    }
    return this._animationLayer.playSegments(segments, forceFlag);
  };

  LottieLayer.prototype.setSpeed = function(speed) {
    if (speed == null) {
      speed = this.speed;
    }
    return this._animationLayer.setSpeed(speed);
  };

  LottieLayer.prototype.setDirection = function(direction) {
    if (direction == null) {
      direction = this.direction;
    }
    return this._animationLayer.setDirection(direction);
  };

  LottieLayer.prototype.onComplete = function(callback) {
    if (this.loop) {
      return this._animationLayer.addEventListener("loopComplete", callback);
    } else {
      return this._animationLayer.addEventListener("complete", callback);
    }
  };

  return LottieLayer;

})(Layer);


},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL21hbmhhcnQvRG9jdW1lbnRzLzAyX0Rldi9mcmFtZXItc2tldGNoYm9vay9mcmFtZXItc2tldGNocy8wMzQtbG90dGllLUkuZnJhbWVyL21vZHVsZXMvbXlNb2R1bGUuY29mZmVlIiwiLi4vLi4vLi4vLi4vLi4vVXNlcnMvbWFuaGFydC9Eb2N1bWVudHMvMDJfRGV2L2ZyYW1lci1za2V0Y2hib29rL2ZyYW1lci1za2V0Y2hzLzAzNC1sb3R0aWUtSS5mcmFtZXIvbW9kdWxlcy9Mb3R0aWVMYXllci5jb2ZmZWUiLCJub2RlX21vZHVsZXMvYnJvd3Nlci1wYWNrL19wcmVsdWRlLmpzIl0sInNvdXJjZXNDb250ZW50IjpbIiMgQWRkIHRoZSBmb2xsb3dpbmcgbGluZSB0byB5b3VyIHByb2plY3QgaW4gRnJhbWVyIFN0dWRpby4gXG4jIG15TW9kdWxlID0gcmVxdWlyZSBcIm15TW9kdWxlXCJcbiMgUmVmZXJlbmNlIHRoZSBjb250ZW50cyBieSBuYW1lLCBsaWtlIG15TW9kdWxlLm15RnVuY3Rpb24oKSBvciBteU1vZHVsZS5teVZhclxuXG5leHBvcnRzLm15VmFyID0gXCJteVZhcmlhYmxlXCJcblxuZXhwb3J0cy5teUZ1bmN0aW9uID0gLT5cblx0cHJpbnQgXCJteUZ1bmN0aW9uIGlzIHJ1bm5pbmdcIlxuXG5leHBvcnRzLm15QXJyYXkgPSBbMSwgMiwgM10iLCIjIyNcbkxvdHRpZUxheWVyXG4tXG5JbXBsZW1lbnRhdGlvbiBvZiBIZXJuYW4gVG9ycmlzaSAmIEFpckJuYiBcIkxvdHRpZS1XZWJcIiBmb3IgRnJhbWVyLlxuYnkgQDcybWVuYVxuIyMjXG5cbiMgSU5DTFVERSBMSUJSQVJZIOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlFxuaW5zZXJ0U2NyaXB0ID0gKGxvY2FsU2NyaXB0LCB3ZWJTY3JpcHQsIG5hbWUgPSAnSmF2YVNjcmlwdCBMaWJyYXJ5JykgLT5cblx0dHJ5XG5cdFx0bGliID0gVXRpbHMuZG9tTG9hZERhdGFTeW5jIGxvY2FsU2NyaXB0XG5cdFx0Y29uc29sZS5sb2cgXCIlYyN7bmFtZX0gU3VjY2Vzc2Z1bGx5IEluY2x1ZGVkIExvY2FsbHlcIiwgXCJiYWNrZ3JvdW5kOiAjRERGRkUzOyBjb2xvcjogIzAwNzgxNFwiXG5cdGNhdGNoIGVcblx0XHR0cnlcblx0XHRcdGxpYiA9IFV0aWxzLmRvbUxvYWREYXRhU3luYyB3ZWJTY3JpcHRcblx0XHRcdGNvbnNvbGUubG9nIFwiJWMje25hbWV9IFN1Y2Nlc3NmdWxseSBJbmNsdWRlZCBmcm9tIFdlYlwiLCBcImJhY2tncm91bmQ6ICNEREZGRTM7IGNvbG9yOiAjMDA3ODE0XCJcblx0XHRjYXRjaCBlXG5cdFx0XHR0aHJvdyBFcnJvcihcIlNvcnJ5LCBJIGNvdWxkbid0IGxvYWQgI3tuYW1lfVwiKVxuXG5cblx0c2NyaXB0ID0gZG9jdW1lbnQuY3JlYXRlRWxlbWVudCBcInNjcmlwdFwiXG5cdHNjcmlwdC50eXBlID0gXCJ0ZXh0L2phdmFzY3JpcHRcIlxuXHRzY3JpcHQuaW5uZXJIVE1MID0gbGliXG5cblx0aGVhZCA9IGRvY3VtZW50LmdldEVsZW1lbnRzQnlUYWdOYW1lKFwiaGVhZFwiKVswXVxuXHRoZWFkLmFwcGVuZENoaWxkIHNjcmlwdFxuXG5cdHNjcmlwdFxuXG5pbnNlcnRTY3JpcHQoXCJtb2R1bGVzL2xvdHRpZS5taW4uanNcIiwgXCJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vYWlyYm5iL2xvdHRpZS13ZWIvbWFzdGVyL2J1aWxkL3BsYXllci9sb3R0aWUubWluLmpzXCIsIFwibG90dGllLXdlYlwiKVxuXG5cbiMgTE9UVElFIExBWUVSIOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlOKAlFxuY2xhc3MgZXhwb3J0cy5Mb3R0aWVMYXllciBleHRlbmRzIExheWVyXG5cblx0QGRlZmluZSBcInNwZWVkXCIsXG5cdFx0Z2V0OiAtPiBAX3Byb3BlcnRpZXNbXCJzcGVlZFwiXVxuXHRcdHNldDogKHZhbHVlKSAtPlxuXHRcdFx0QF9wcm9wZXJ0aWVzW1wic3BlZWRcIl0gPSB2YWx1ZVxuXHRcdFx0QHNldFNwZWVkKHZhbHVlKSBpZiBAYnVpbHRcblx0XHRcdEBlbWl0IFwiY2hhbmdlOnNwZWVkXCJcblxuXHRAZGVmaW5lIFwiZGlyZWN0aW9uXCIsXG5cdFx0Z2V0OiAtPiBAX3Byb3BlcnRpZXNbXCJkaXJlY3Rpb25cIl1cblx0XHRzZXQ6ICh2YWx1ZSkgLT5cblx0XHRcdEBfcHJvcGVydGllc1tcImRpcmVjdGlvblwiXSA9IHZhbHVlXG5cdFx0XHRAc2V0RGlyZWN0aW9uKHZhbHVlKSBpZiBAYnVpbHRcblx0XHRcdEBlbWl0IFwiY2hhbmdlOmRpcmVjdGlvblwiXG5cblx0QGRlZmluZSBcInBhdGhcIixcblx0XHRnZXQ6IC0+IEBfcHJvcGVydGllc1tcInBhdGhcIl1cblx0XHRzZXQ6ICh2YWx1ZSkgLT5cblx0XHRcdEBfcHJvcGVydGllc1tcInBhdGhcIl0gPSB2YWx1ZVxuXHRcdFx0QHNldFNldHRpbmdzKCkgaWYgQGJ1aWx0XG5cdFx0XHRAZW1pdCBcImNoYW5nZTpwYXRoXCJcblxuXG5cdGNvbnN0cnVjdG9yOiAoQG9wdGlvbnM9e30pIC0+XG5cdFx0IyBEZWZhdWx0c1xuXHRcdEBvcHRpb25zLmJhY2tncm91bmRDb2xvciA/PSBudWxsXG5cdFx0QG9wdGlvbnMucGF0aCA/PSBudWxsXG5cdFx0QG9wdGlvbnMuYXV0b3BsYXkgPz0gdHJ1ZVxuXHRcdEBvcHRpb25zLmxvb3AgPz0gdHJ1ZVxuXHRcdEBvcHRpb25zLnNwZWVkID89IDFcblx0XHRAb3B0aW9ucy5kaXJlY3Rpb24gPz0gMVxuXHRcdEBvcHRpb25zLnJlbmRlcmVyID89IFwic3ZnXCJcblxuXHRcdHN1cGVyIEBvcHRpb25zXG5cblx0XHRpZiBAb3B0aW9ucy5wYXRoIGlzIG51bGxcblx0XHRcdHByaW50IFwiRnJvbSBMb3R0aWVMYXllcjogU2V0dGluZyBhIHBhdGggdG8geW91ciBqc29uIGZpbGUgaXMgcmVxdWlyZWQuXCJcblx0XHRpZiBAbmFtZSBpcyBcIlwiXG5cdFx0XHRwcmludCBcIkZyb20gTG90dGllTGF5ZXI6IFRoZSAnbmFtZScgYXR0cmlidXRlIGlzIHJlcXVpcmVkLlwiXG5cblx0XHQjU2hvcnRjdXRzXG5cdFx0QGF1dG9wbGF5ID0gQG9wdGlvbnMuYXV0b3BsYXlcblx0XHRAbG9vcCA9IEBvcHRpb25zLmxvb3Bcblx0XHRAcmVuZGVyZXIgPSBAb3B0aW9ucy5yZW5kZXJlclxuXG5cdFx0I1ZhcnNcblx0XHRAYnVpbHQgPSBmYWxzZVxuXHRcdEBfYW5pbWF0aW9uTGF5ZXIgPSBudWxsXG5cblx0XHQjUnVuXG5cdFx0QGJ1aWxkKClcblxuXHRidWlsZDogKCkgLT5cblx0XHRAaHRtbCA9ICc8ZGl2IGlkPScrXCIje0BuYW1lfVwiKyc+PC9kaXY+J1xuXHRcdEBzZXRTZXR0aW5ncygpXG5cdFx0QGJ1aWx0ID0gdHJ1ZVxuXG5cdHNldFNldHRpbmdzOiAoKSAtPlxuXHRcdF9jb250YWluZXIgPSBkb2N1bWVudC5nZXRFbGVtZW50QnlJZChAbmFtZSlcblx0XHRfY29udGFpbmVyLmlubmVySFRNTCA9IFwiXCJcblxuXHRcdGxvdHRpZVNldHRpbmdzID1cblx0XHRcdGNvbnRhaW5lcjogX2NvbnRhaW5lcixcblx0XHRcdHBhdGg6IEBwYXRoLFxuXHRcdFx0cmVuZGVyZXI6IEByZW5kZXJlcixcblx0XHRcdGF1dG9wbGF5OiBAYXV0b3BsYXksXG5cdFx0XHRsb29wOiBAbG9vcFxuXG5cdFx0QF9hbmltYXRpb25MYXllciA9IGxvdHRpZS5sb2FkQW5pbWF0aW9uKGxvdHRpZVNldHRpbmdzKTtcblx0XHRAc2V0U3BlZWQoKVxuXHRcdEBzZXREaXJlY3Rpb24oKVxuXG5cdHBsYXk6ICgpIC0+XG5cdFx0QF9hbmltYXRpb25MYXllci5wbGF5KClcblx0c3RvcDogKCkgLT5cblx0XHRAX2FuaW1hdGlvbkxheWVyLnN0b3AoKVxuXHRwYXVzZTogKCkgLT5cblx0XHRAX2FuaW1hdGlvbkxheWVyLnBhdXNlKClcblx0Z29Ub0FuZFBsYXk6ICh2YWx1ZSwgaXNGcmFtZSkgLT5cblx0XHRpc0ZyYW1lID89IHRydWVcblx0XHRAX2FuaW1hdGlvbkxheWVyLmdvVG9BbmRQbGF5KHZhbHVlLCBpc0ZyYW1lKVxuXHRnb1RvQW5kU3RvcDogKHZhbHVlLCBpc0ZyYW1lKSAtPlxuXHRcdGlzRnJhbWUgPz0gdHJ1ZVxuXHRcdEBfYW5pbWF0aW9uTGF5ZXIuZ29Ub0FuZFN0b3AodmFsdWUsIGlzRnJhbWUpXG5cdHBsYXlTZWdtZW50czogKHNlZ21lbnRzLCBmb3JjZUZsYWcpIC0+XG5cdFx0Zm9yY2VGbGFnID89IHRydWVcblx0XHRAX2FuaW1hdGlvbkxheWVyLnBsYXlTZWdtZW50cyhzZWdtZW50cywgZm9yY2VGbGFnKVxuXHRzZXRTcGVlZDogKHNwZWVkKSAtPlxuXHRcdHNwZWVkID89IEBzcGVlZFxuXHRcdEBfYW5pbWF0aW9uTGF5ZXIuc2V0U3BlZWQoc3BlZWQpXG5cdHNldERpcmVjdGlvbjogKGRpcmVjdGlvbikgLT5cblx0XHRkaXJlY3Rpb24gPz0gQGRpcmVjdGlvblxuXHRcdEBfYW5pbWF0aW9uTGF5ZXIuc2V0RGlyZWN0aW9uKGRpcmVjdGlvbilcblx0b25Db21wbGV0ZTogKGNhbGxiYWNrKSAtPlxuXHRcdGlmIEBsb29wXG5cdFx0XHRAX2FuaW1hdGlvbkxheWVyLmFkZEV2ZW50TGlzdGVuZXIgXCJsb29wQ29tcGxldGVcIiwgY2FsbGJhY2tcblx0XHRlbHNlXG5cdFx0XHRAX2FuaW1hdGlvbkxheWVyLmFkZEV2ZW50TGlzdGVuZXIgXCJjb21wbGV0ZVwiLCBjYWxsYmFja1xuIiwiKGZ1bmN0aW9uIGUodCxuLHIpe2Z1bmN0aW9uIHMobyx1KXtpZighbltvXSl7aWYoIXRbb10pe3ZhciBhPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7aWYoIXUmJmEpcmV0dXJuIGEobywhMCk7aWYoaSlyZXR1cm4gaShvLCEwKTt2YXIgZj1uZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK28rXCInXCIpO3Rocm93IGYuY29kZT1cIk1PRFVMRV9OT1RfRk9VTkRcIixmfXZhciBsPW5bb109e2V4cG9ydHM6e319O3Rbb11bMF0uY2FsbChsLmV4cG9ydHMsZnVuY3Rpb24oZSl7dmFyIG49dFtvXVsxXVtlXTtyZXR1cm4gcyhuP246ZSl9LGwsbC5leHBvcnRzLGUsdCxuLHIpfXJldHVybiBuW29dLmV4cG9ydHN9dmFyIGk9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtmb3IodmFyIG89MDtvPHIubGVuZ3RoO28rKylzKHJbb10pO3JldHVybiBzfSkiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFFQUE7O0FEQUE7Ozs7OztBQUFBLElBQUEsWUFBQTtFQUFBOzs7QUFRQSxZQUFBLEdBQWUsU0FBQyxXQUFELEVBQWMsU0FBZCxFQUF5QixJQUF6QjtBQUNkLE1BQUE7O0lBRHVDLE9BQU87O0FBQzlDO0lBQ0MsR0FBQSxHQUFNLEtBQUssQ0FBQyxlQUFOLENBQXNCLFdBQXRCO0lBQ04sT0FBTyxDQUFDLEdBQVIsQ0FBWSxJQUFBLEdBQUssSUFBTCxHQUFVLGdDQUF0QixFQUF1RCxxQ0FBdkQsRUFGRDtHQUFBLGFBQUE7SUFHTTtBQUNMO01BQ0MsR0FBQSxHQUFNLEtBQUssQ0FBQyxlQUFOLENBQXNCLFNBQXRCO01BQ04sT0FBTyxDQUFDLEdBQVIsQ0FBWSxJQUFBLEdBQUssSUFBTCxHQUFVLGlDQUF0QixFQUF3RCxxQ0FBeEQsRUFGRDtLQUFBLGFBQUE7TUFHTTtBQUNMLFlBQU0sS0FBQSxDQUFNLHlCQUFBLEdBQTBCLElBQWhDLEVBSlA7S0FKRDs7RUFXQSxNQUFBLEdBQVMsUUFBUSxDQUFDLGFBQVQsQ0FBdUIsUUFBdkI7RUFDVCxNQUFNLENBQUMsSUFBUCxHQUFjO0VBQ2QsTUFBTSxDQUFDLFNBQVAsR0FBbUI7RUFFbkIsSUFBQSxHQUFPLFFBQVEsQ0FBQyxvQkFBVCxDQUE4QixNQUE5QixDQUFzQyxDQUFBLENBQUE7RUFDN0MsSUFBSSxDQUFDLFdBQUwsQ0FBaUIsTUFBakI7U0FFQTtBQW5CYzs7QUFxQmYsWUFBQSxDQUFhLHVCQUFiLEVBQXNDLHVGQUF0QyxFQUErSCxZQUEvSDs7QUFJTSxPQUFPLENBQUM7OztFQUViLFdBQUMsQ0FBQSxNQUFELENBQVEsT0FBUixFQUNDO0lBQUEsR0FBQSxFQUFLLFNBQUE7YUFBRyxJQUFDLENBQUEsV0FBWSxDQUFBLE9BQUE7SUFBaEIsQ0FBTDtJQUNBLEdBQUEsRUFBSyxTQUFDLEtBQUQ7TUFDSixJQUFDLENBQUEsV0FBWSxDQUFBLE9BQUEsQ0FBYixHQUF3QjtNQUN4QixJQUFvQixJQUFDLENBQUEsS0FBckI7UUFBQSxJQUFDLENBQUEsUUFBRCxDQUFVLEtBQVYsRUFBQTs7YUFDQSxJQUFDLENBQUEsSUFBRCxDQUFNLGNBQU47SUFISSxDQURMO0dBREQ7O0VBT0EsV0FBQyxDQUFBLE1BQUQsQ0FBUSxXQUFSLEVBQ0M7SUFBQSxHQUFBLEVBQUssU0FBQTthQUFHLElBQUMsQ0FBQSxXQUFZLENBQUEsV0FBQTtJQUFoQixDQUFMO0lBQ0EsR0FBQSxFQUFLLFNBQUMsS0FBRDtNQUNKLElBQUMsQ0FBQSxXQUFZLENBQUEsV0FBQSxDQUFiLEdBQTRCO01BQzVCLElBQXdCLElBQUMsQ0FBQSxLQUF6QjtRQUFBLElBQUMsQ0FBQSxZQUFELENBQWMsS0FBZCxFQUFBOzthQUNBLElBQUMsQ0FBQSxJQUFELENBQU0sa0JBQU47SUFISSxDQURMO0dBREQ7O0VBT0EsV0FBQyxDQUFBLE1BQUQsQ0FBUSxNQUFSLEVBQ0M7SUFBQSxHQUFBLEVBQUssU0FBQTthQUFHLElBQUMsQ0FBQSxXQUFZLENBQUEsTUFBQTtJQUFoQixDQUFMO0lBQ0EsR0FBQSxFQUFLLFNBQUMsS0FBRDtNQUNKLElBQUMsQ0FBQSxXQUFZLENBQUEsTUFBQSxDQUFiLEdBQXVCO01BQ3ZCLElBQWtCLElBQUMsQ0FBQSxLQUFuQjtRQUFBLElBQUMsQ0FBQSxXQUFELENBQUEsRUFBQTs7YUFDQSxJQUFDLENBQUEsSUFBRCxDQUFNLGFBQU47SUFISSxDQURMO0dBREQ7O0VBUWEscUJBQUMsT0FBRDtBQUVaLFFBQUE7SUFGYSxJQUFDLENBQUEsNEJBQUQsVUFBUzs7VUFFZCxDQUFDLGtCQUFtQjs7O1dBQ3BCLENBQUMsT0FBUTs7O1dBQ1QsQ0FBQyxXQUFZOzs7V0FDYixDQUFDLE9BQVE7OztXQUNULENBQUMsUUFBUzs7O1dBQ1YsQ0FBQyxZQUFhOzs7V0FDZCxDQUFDLFdBQVk7O0lBRXJCLDZDQUFNLElBQUMsQ0FBQSxPQUFQO0lBRUEsSUFBRyxJQUFDLENBQUEsT0FBTyxDQUFDLElBQVQsS0FBaUIsSUFBcEI7TUFDQyxLQUFBLENBQU0saUVBQU4sRUFERDs7SUFFQSxJQUFHLElBQUMsQ0FBQSxJQUFELEtBQVMsRUFBWjtNQUNDLEtBQUEsQ0FBTSxxREFBTixFQUREOztJQUlBLElBQUMsQ0FBQSxRQUFELEdBQVksSUFBQyxDQUFBLE9BQU8sQ0FBQztJQUNyQixJQUFDLENBQUEsSUFBRCxHQUFRLElBQUMsQ0FBQSxPQUFPLENBQUM7SUFDakIsSUFBQyxDQUFBLFFBQUQsR0FBWSxJQUFDLENBQUEsT0FBTyxDQUFDO0lBR3JCLElBQUMsQ0FBQSxLQUFELEdBQVM7SUFDVCxJQUFDLENBQUEsZUFBRCxHQUFtQjtJQUduQixJQUFDLENBQUEsS0FBRCxDQUFBO0VBM0JZOzt3QkE2QmIsS0FBQSxHQUFPLFNBQUE7SUFDTixJQUFDLENBQUEsSUFBRCxHQUFRLFVBQUEsR0FBVyxDQUFBLEVBQUEsR0FBRyxJQUFDLENBQUEsSUFBSixDQUFYLEdBQXNCO0lBQzlCLElBQUMsQ0FBQSxXQUFELENBQUE7V0FDQSxJQUFDLENBQUEsS0FBRCxHQUFTO0VBSEg7O3dCQUtQLFdBQUEsR0FBYSxTQUFBO0FBQ1osUUFBQTtJQUFBLFVBQUEsR0FBYSxRQUFRLENBQUMsY0FBVCxDQUF3QixJQUFDLENBQUEsSUFBekI7SUFDYixVQUFVLENBQUMsU0FBWCxHQUF1QjtJQUV2QixjQUFBLEdBQ0M7TUFBQSxTQUFBLEVBQVcsVUFBWDtNQUNBLElBQUEsRUFBTSxJQUFDLENBQUEsSUFEUDtNQUVBLFFBQUEsRUFBVSxJQUFDLENBQUEsUUFGWDtNQUdBLFFBQUEsRUFBVSxJQUFDLENBQUEsUUFIWDtNQUlBLElBQUEsRUFBTSxJQUFDLENBQUEsSUFKUDs7SUFNRCxJQUFDLENBQUEsZUFBRCxHQUFtQixNQUFNLENBQUMsYUFBUCxDQUFxQixjQUFyQjtJQUNuQixJQUFDLENBQUEsUUFBRCxDQUFBO1dBQ0EsSUFBQyxDQUFBLFlBQUQsQ0FBQTtFQWJZOzt3QkFlYixJQUFBLEdBQU0sU0FBQTtXQUNMLElBQUMsQ0FBQSxlQUFlLENBQUMsSUFBakIsQ0FBQTtFQURLOzt3QkFFTixJQUFBLEdBQU0sU0FBQTtXQUNMLElBQUMsQ0FBQSxlQUFlLENBQUMsSUFBakIsQ0FBQTtFQURLOzt3QkFFTixLQUFBLEdBQU8sU0FBQTtXQUNOLElBQUMsQ0FBQSxlQUFlLENBQUMsS0FBakIsQ0FBQTtFQURNOzt3QkFFUCxXQUFBLEdBQWEsU0FBQyxLQUFELEVBQVEsT0FBUjs7TUFDWixVQUFXOztXQUNYLElBQUMsQ0FBQSxlQUFlLENBQUMsV0FBakIsQ0FBNkIsS0FBN0IsRUFBb0MsT0FBcEM7RUFGWTs7d0JBR2IsV0FBQSxHQUFhLFNBQUMsS0FBRCxFQUFRLE9BQVI7O01BQ1osVUFBVzs7V0FDWCxJQUFDLENBQUEsZUFBZSxDQUFDLFdBQWpCLENBQTZCLEtBQTdCLEVBQW9DLE9BQXBDO0VBRlk7O3dCQUdiLFlBQUEsR0FBYyxTQUFDLFFBQUQsRUFBVyxTQUFYOztNQUNiLFlBQWE7O1dBQ2IsSUFBQyxDQUFBLGVBQWUsQ0FBQyxZQUFqQixDQUE4QixRQUE5QixFQUF3QyxTQUF4QztFQUZhOzt3QkFHZCxRQUFBLEdBQVUsU0FBQyxLQUFEOztNQUNULFFBQVMsSUFBQyxDQUFBOztXQUNWLElBQUMsQ0FBQSxlQUFlLENBQUMsUUFBakIsQ0FBMEIsS0FBMUI7RUFGUzs7d0JBR1YsWUFBQSxHQUFjLFNBQUMsU0FBRDs7TUFDYixZQUFhLElBQUMsQ0FBQTs7V0FDZCxJQUFDLENBQUEsZUFBZSxDQUFDLFlBQWpCLENBQThCLFNBQTlCO0VBRmE7O3dCQUdkLFVBQUEsR0FBWSxTQUFDLFFBQUQ7SUFDWCxJQUFHLElBQUMsQ0FBQSxJQUFKO2FBQ0MsSUFBQyxDQUFBLGVBQWUsQ0FBQyxnQkFBakIsQ0FBa0MsY0FBbEMsRUFBa0QsUUFBbEQsRUFERDtLQUFBLE1BQUE7YUFHQyxJQUFDLENBQUEsZUFBZSxDQUFDLGdCQUFqQixDQUFrQyxVQUFsQyxFQUE4QyxRQUE5QyxFQUhEOztFQURXOzs7O0dBOUZxQjs7OztBRDdCbEMsT0FBTyxDQUFDLEtBQVIsR0FBZ0I7O0FBRWhCLE9BQU8sQ0FBQyxVQUFSLEdBQXFCLFNBQUE7U0FDcEIsS0FBQSxDQUFNLHVCQUFOO0FBRG9COztBQUdyQixPQUFPLENBQUMsT0FBUixHQUFrQixDQUFDLENBQUQsRUFBSSxDQUFKLEVBQU8sQ0FBUCJ9

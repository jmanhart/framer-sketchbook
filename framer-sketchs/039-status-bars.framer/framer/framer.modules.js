require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}],"statusBars":[function(require,module,exports){
var date, statusColors, timeOptions,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

statusColors = require("statusColors");

date = new Date();

timeOptions = {
  hour: '2-digit',
  minute: '2-digit'
};

exports.standardBar = (function(superClass) {
  var batteryContainerHeight, batteryContainerWidth, batteryFillHeight, batteryFillWidth, batteryNubHeight, batteryNubWidth, batteryOutlineBorderWidth, batteryOutlineHeight, batteryOutlineWidth, batterySpacer, height, inactiveGray, textFamily, textSize;

  extend(standardBar, superClass);

  batteryOutlineBorderWidth = 1;

  batterySpacer = batteryOutlineBorderWidth * 2;

  batteryFillWidth = 20;

  batteryFillHeight = 7.5;

  batteryOutlineWidth = batteryFillWidth + batterySpacer;

  batteryOutlineHeight = batteryFillHeight + batterySpacer;

  batteryNubWidth = 1.5;

  batteryNubHeight = 3.5;

  batteryContainerWidth = batteryOutlineWidth + batteryNubWidth + (batterySpacer * 2);

  batteryContainerHeight = batteryOutlineHeight + (batterySpacer + .5);

  height = 20;

  textSize = 12;

  textFamily = "arial";

  inactiveGray = "rgba(255,255,255,0.4)";

  function standardBar(options) {
    var barHeight, batterChargePercent, batteryChargePercent, batteryFill, batteryFillClip, batteryFillProgress, batteryIconContainer, batteryNub, batteryOutline, i, j, signalBar, signalBars, signalContainer, textColor, time;
    standardBar.__super__.constructor.call(this, _.defaults(options, {
      height: height,
      width: 375,
      backgroundColor: statusColors.black
    }));
    time = new TextLayer({
      text: date.toLocaleString('en-US', timeOptions),
      parent: this,
      x: Align.center(),
      y: Align.center(),
      color: textColor,
      fontSize: textSize,
      fontFamily: textFamily
    });
    batteryChargePercent = options.chargePercent || 66;
    batteryFill = Math.floor((batteryChargePercent / 100) * batteryFillWidth);
    batterChargePercent = new TextLayer({
      parent: this,
      fontSize: textSize,
      fontFamily: textFamily,
      color: textColor,
      text: batteryChargePercent + "%",
      y: Align.center(),
      x: Align.right(-(13 + batteryContainerWidth))
    });
    batteryIconContainer = new Layer({
      parent: this,
      name: "Battery Icon Container",
      width: batteryContainerWidth,
      height: batteryContainerHeight,
      y: Align.center(),
      x: Align.right(-8),
      backgroundColor: null,
      borderRadius: 2
    });
    batteryNub = new Layer({
      parent: batteryIconContainer,
      name: "Battery Nub",
      width: 1.5,
      height: 3.5,
      backgroundColor: textColor,
      x: Align.right(),
      y: Align.center()
    });
    batteryFillClip = new Layer({
      parent: batteryIconContainer,
      name: "Battery Fill",
      width: batteryFillWidth,
      height: batteryFillHeight,
      backgroundColor: null,
      x: Align.left(2),
      y: Align.center()
    });
    batteryFillProgress = new Layer({
      parent: batteryFillClip,
      name: "Battery Fill Progress",
      width: batteryFill,
      height: batteryFillHeight,
      backgroundColor: textColor
    });
    if (batteryChargePercent <= 10) {
      batteryFillProgress.backgroundColor = "red";
    }
    batteryOutline = new Layer({
      parent: batteryIconContainer,
      name: "Battery Outline",
      width: batteryOutlineWidth + batterySpacer,
      height: batteryOutlineHeight + batterySpacer,
      borderWidth: 1,
      borderColor: textColor,
      backgroundColor: null,
      borderRadius: 2.5,
      x: Align.left(),
      y: Align.center()
    });
    barHeight = [4, 6, 8, 10];
    signalContainer = new Layer({
      parent: this,
      width: 15,
      height: 10,
      x: Align.left(10),
      y: Align.center(),
      backgroundColor: null
    });
    signalBars = [];
    for (i = j = 0; j < 4; i = ++j) {
      signalBar = new Layer({
        parent: signalContainer,
        width: 3,
        height: barHeight[i],
        backgroundColor: inactiveGray,
        borderRadius: 0.75,
        x: Align.left((3 + 1) * i),
        y: Align.bottom()
      });
      signalBars.push(signalBar);
    }
    if (options.signalStrength === "perfect") {
      signalBars[0].opacity = 1;
      signalBars[0].backgroundColor = "white";
      signalBars[1].opacity = 1;
      signalBars[1].backgroundColor = "white";
      signalBars[2].opacity = 1;
      signalBars[2].backgroundColor = "white";
      signalBars[3].opacity = 1;
      signalBars[3].backgroundColor = "white";
    }
    if (options.signalStrength === "good") {
      signalBars[0].opacity = 1;
      signalBars[0].backgroundColor = "white";
      signalBars[1].opacity = 1;
      signalBars[1].backgroundColor = "white";
      signalBars[2].opacity = 1;
      signalBars[2].backgroundColor = "white";
    }
    if (options.signalStrength === "ok") {
      signalBars[0].opacity = 1;
      signalBars[0].backgroundColor = "white";
      signalBars[1].opacity = 1;
      signalBars[1].backgroundColor = "white";
    }
    if (options.signalStrength === "bad") {
      signalBars[0].opacity = 1;
      signalBars[0].backgroundColor = "white";
    }
    if (options.barType === "dark") {
      this.backgroundColor = "black";
      textColor = "#fff";
      inactiveGray = inactiveGray;
    }
    if (options.barType === "light") {
      this.backgroundColor = null;
      textColor = "#000";
    }
  }

  return standardBar;

})(Layer);


},{"statusColors":"statusColors"}],"statusColors":[function(require,module,exports){
exports.black = "#000";

exports.white = "#fff";


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL21hbmhhcnQvRG9jdW1lbnRzLzAyX0Rldi9mcmFtZXItc2tldGNoYm9vay9mcmFtZXItc2tldGNocy8wMzktc3RhdHVzLWJhcnMuZnJhbWVyL21vZHVsZXMvc3RhdHVzQ29sb3JzLmNvZmZlZSIsIi4uLy4uLy4uLy4uLy4uL1VzZXJzL21hbmhhcnQvRG9jdW1lbnRzLzAyX0Rldi9mcmFtZXItc2tldGNoYm9vay9mcmFtZXItc2tldGNocy8wMzktc3RhdHVzLWJhcnMuZnJhbWVyL21vZHVsZXMvc3RhdHVzQmFycy5jb2ZmZWUiLCIuLi8uLi8uLi8uLi8uLi9Vc2Vycy9tYW5oYXJ0L0RvY3VtZW50cy8wMl9EZXYvZnJhbWVyLXNrZXRjaGJvb2svZnJhbWVyLXNrZXRjaHMvMDM5LXN0YXR1cy1iYXJzLmZyYW1lci9tb2R1bGVzL215TW9kdWxlLmNvZmZlZSIsIm5vZGVfbW9kdWxlcy9icm93c2VyLXBhY2svX3ByZWx1ZGUuanMiXSwic291cmNlc0NvbnRlbnQiOlsiZXhwb3J0cy5ibGFjayA9IFwiIzAwMFwiXG5leHBvcnRzLndoaXRlID0gXCIjZmZmXCJcbiIsInN0YXR1c0NvbG9ycyA9IHJlcXVpcmUgXCJzdGF0dXNDb2xvcnNcIlxuXG5kYXRlID0gbmV3IERhdGUoKTtcbnRpbWVPcHRpb25zID0ge2hvdXI6ICcyLWRpZ2l0JywgbWludXRlOiAnMi1kaWdpdCcgfTtcblxuY2xhc3MgZXhwb3J0cy5zdGFuZGFyZEJhciBleHRlbmRzIExheWVyXG5cblxuICBiYXR0ZXJ5T3V0bGluZUJvcmRlcldpZHRoID0gMVxuICBiYXR0ZXJ5U3BhY2VyID0gYmF0dGVyeU91dGxpbmVCb3JkZXJXaWR0aCAqIDJcbiAgYmF0dGVyeUZpbGxXaWR0aCA9IDIwXG4gIGJhdHRlcnlGaWxsSGVpZ2h0ID0gNy41XG4gIGJhdHRlcnlPdXRsaW5lV2lkdGggPSBiYXR0ZXJ5RmlsbFdpZHRoICsgYmF0dGVyeVNwYWNlclxuICBiYXR0ZXJ5T3V0bGluZUhlaWdodCA9IGJhdHRlcnlGaWxsSGVpZ2h0ICsgYmF0dGVyeVNwYWNlclxuICBiYXR0ZXJ5TnViV2lkdGggPSAxLjVcbiAgYmF0dGVyeU51YkhlaWdodCA9IDMuNVxuICBiYXR0ZXJ5Q29udGFpbmVyV2lkdGggPSBiYXR0ZXJ5T3V0bGluZVdpZHRoICsgYmF0dGVyeU51YldpZHRoICsgKGJhdHRlcnlTcGFjZXIqMilcbiAgYmF0dGVyeUNvbnRhaW5lckhlaWdodCA9IGJhdHRlcnlPdXRsaW5lSGVpZ2h0ICsgKGJhdHRlcnlTcGFjZXIgKyAuNSlcbiAgaGVpZ2h0ID0gMjBcbiAgdGV4dFNpemUgPSAxMlxuICB0ZXh0RmFtaWx5ID0gXCJhcmlhbFwiXG4gIGluYWN0aXZlR3JheSA9IFwicmdiYSgyNTUsMjU1LDI1NSwwLjQpXCJcblxuXG4gIGNvbnN0cnVjdG9yOiAob3B0aW9ucykgLT5cbiAgICBzdXBlciBfLmRlZmF1bHRzIG9wdGlvbnMsXG4gICAgICBoZWlnaHQ6IGhlaWdodFxuICAgICAgd2lkdGg6IDM3NVxuICAgICAgYmFja2dyb3VuZENvbG9yOiBzdGF0dXNDb2xvcnMuYmxhY2tcblxuICAgIHRpbWUgPSBuZXcgVGV4dExheWVyXG4gICAgICB0ZXh0OiBkYXRlLnRvTG9jYWxlU3RyaW5nKCdlbi1VUycsIHRpbWVPcHRpb25zKVxuICAgICAgcGFyZW50OiBAXG4gICAgICB4OiBBbGlnbi5jZW50ZXIoKVxuICAgICAgeTogQWxpZ24uY2VudGVyKClcbiAgICAgIGNvbG9yOiB0ZXh0Q29sb3JcbiAgICAgIGZvbnRTaXplOiB0ZXh0U2l6ZVxuICAgICAgZm9udEZhbWlseTogdGV4dEZhbWlseVxuXG4gICAgYmF0dGVyeUNoYXJnZVBlcmNlbnQgPSBvcHRpb25zLmNoYXJnZVBlcmNlbnQgfHwgNjZcbiAgICBiYXR0ZXJ5RmlsbCA9IE1hdGguZmxvb3IoKGJhdHRlcnlDaGFyZ2VQZXJjZW50IC8gKDEwMCkpICogYmF0dGVyeUZpbGxXaWR0aClcblxuICAgIGJhdHRlckNoYXJnZVBlcmNlbnQgPSBuZXcgVGV4dExheWVyXG4gICAgICBwYXJlbnQ6IEBcbiAgICAgIGZvbnRTaXplOiB0ZXh0U2l6ZVxuICAgICAgZm9udEZhbWlseTogdGV4dEZhbWlseVxuICAgICAgY29sb3I6IHRleHRDb2xvclxuICAgICAgdGV4dDogYmF0dGVyeUNoYXJnZVBlcmNlbnQgKyBcIiVcIlxuICAgICAgeTogQWxpZ24uY2VudGVyKClcbiAgICAgIHg6IEFsaWduLnJpZ2h0KC0oKDEzKStiYXR0ZXJ5Q29udGFpbmVyV2lkdGgpKVxuXG4gICAgYmF0dGVyeUljb25Db250YWluZXIgPSBuZXcgTGF5ZXJcbiAgICAgIHBhcmVudDogQFxuICAgICAgbmFtZTogXCJCYXR0ZXJ5IEljb24gQ29udGFpbmVyXCJcbiAgICAgIHdpZHRoOiBiYXR0ZXJ5Q29udGFpbmVyV2lkdGhcbiAgICAgIGhlaWdodDogYmF0dGVyeUNvbnRhaW5lckhlaWdodFxuICAgICAgeTogQWxpZ24uY2VudGVyKClcbiAgICAgIHg6IEFsaWduLnJpZ2h0KC04KVxuICAgICAgYmFja2dyb3VuZENvbG9yOiBudWxsXG4gICAgICBib3JkZXJSYWRpdXM6IDJcblxuICAgICMgQmF0dGVyeSBGdWxsIENvbnRhaW5lciAtIFRyYW5zcGFyZW50XG4gICAgYmF0dGVyeU51YiA9IG5ldyBMYXllclxuICAgICAgcGFyZW50OiBiYXR0ZXJ5SWNvbkNvbnRhaW5lclxuICAgICAgbmFtZTogXCJCYXR0ZXJ5IE51YlwiXG4gICAgICB3aWR0aDogMS41XG4gICAgICBoZWlnaHQ6IDMuNVxuICAgICAgYmFja2dyb3VuZENvbG9yOiB0ZXh0Q29sb3JcbiAgICAgIHg6IEFsaWduLnJpZ2h0KClcbiAgICAgIHk6IEFsaWduLmNlbnRlcigpXG5cbiAgICAjIEJhdHRlcnkgRnVsbCBDb250YWluZXIgLSBUcmFuc3BhcmVudFxuICAgIGJhdHRlcnlGaWxsQ2xpcCA9IG5ldyBMYXllclxuICAgICAgcGFyZW50OiBiYXR0ZXJ5SWNvbkNvbnRhaW5lclxuICAgICAgbmFtZTogXCJCYXR0ZXJ5IEZpbGxcIlxuICAgICAgd2lkdGg6IGJhdHRlcnlGaWxsV2lkdGhcbiAgICAgIGhlaWdodDogYmF0dGVyeUZpbGxIZWlnaHRcbiAgICAgIGJhY2tncm91bmRDb2xvcjogbnVsbFxuICAgICAgeDogQWxpZ24ubGVmdCgyKVxuICAgICAgeTogQWxpZ24uY2VudGVyKClcblxuICAgIGJhdHRlcnlGaWxsUHJvZ3Jlc3MgPSBuZXcgTGF5ZXJcbiAgICAgIHBhcmVudDogYmF0dGVyeUZpbGxDbGlwXG4gICAgICBuYW1lOiBcIkJhdHRlcnkgRmlsbCBQcm9ncmVzc1wiXG4gICAgICB3aWR0aDogYmF0dGVyeUZpbGxcbiAgICAgIGhlaWdodDogYmF0dGVyeUZpbGxIZWlnaHRcbiAgICAgIGJhY2tncm91bmRDb2xvcjogdGV4dENvbG9yXG4gICAgICAjIHg6IEFsaWduLmxlZnQoMilcbiAgICAgICMgeTogQWxpZ24uY2VudGVyKClcblxuICAgIGlmIGJhdHRlcnlDaGFyZ2VQZXJjZW50IDw9IDEwXG4gICAgICBiYXR0ZXJ5RmlsbFByb2dyZXNzLmJhY2tncm91bmRDb2xvciA9IFwicmVkXCJcblxuICAgIGJhdHRlcnlPdXRsaW5lID0gbmV3IExheWVyXG4gICAgICBwYXJlbnQ6IGJhdHRlcnlJY29uQ29udGFpbmVyXG4gICAgICBuYW1lOiBcIkJhdHRlcnkgT3V0bGluZVwiXG4gICAgICB3aWR0aDogYmF0dGVyeU91dGxpbmVXaWR0aCArIGJhdHRlcnlTcGFjZXJcbiAgICAgIGhlaWdodDogYmF0dGVyeU91dGxpbmVIZWlnaHQgKyBiYXR0ZXJ5U3BhY2VyXG4gICAgICBib3JkZXJXaWR0aDogMVxuICAgICAgYm9yZGVyQ29sb3I6IHRleHRDb2xvclxuICAgICAgYmFja2dyb3VuZENvbG9yOiBudWxsXG4gICAgICBib3JkZXJSYWRpdXM6IDIuNVxuICAgICAgeDogQWxpZ24ubGVmdCgpXG4gICAgICB5OiBBbGlnbi5jZW50ZXIoKVxuXG4gICAgYmFySGVpZ2h0ID0gWyA0LCA2LCA4LCAxMF1cblxuICAgIHNpZ25hbENvbnRhaW5lciA9IG5ldyBMYXllclxuICAgICAgcGFyZW50OiBAXG4gICAgICB3aWR0aDogMTVcbiAgICAgIGhlaWdodDogMTBcbiAgICAgIHg6IEFsaWduLmxlZnQoMTApXG4gICAgICB5OiBBbGlnbi5jZW50ZXIoKVxuICAgICAgYmFja2dyb3VuZENvbG9yOiBudWxsXG5cbiAgICBzaWduYWxCYXJzID1bXVxuXG4gICAgZm9yIGkgaW4gWzAuLi40XVxuICAgICAgc2lnbmFsQmFyID0gbmV3IExheWVyXG4gICAgICAgIHBhcmVudDogc2lnbmFsQ29udGFpbmVyXG4gICAgICAgIHdpZHRoOiAzXG4gICAgICAgIGhlaWdodDogYmFySGVpZ2h0W2ldXG4gICAgICAgIGJhY2tncm91bmRDb2xvcjogaW5hY3RpdmVHcmF5XG4gICAgICAgIGJvcmRlclJhZGl1czogMC43NVxuICAgICAgICB4OiBBbGlnbi5sZWZ0KCgzICsgMSkgKiBpKVxuICAgICAgICB5OiBBbGlnbi5ib3R0b20oKVxuXG4gICAgICBzaWduYWxCYXJzLnB1c2ggc2lnbmFsQmFyXG5cblxuICAgIGlmIG9wdGlvbnMuc2lnbmFsU3RyZW5ndGggPT0gXCJwZXJmZWN0XCJcbiAgICAgIHNpZ25hbEJhcnNbMF0ub3BhY2l0eSA9IDFcbiAgICAgIHNpZ25hbEJhcnNbMF0uYmFja2dyb3VuZENvbG9yID0gXCJ3aGl0ZVwiXG4gICAgICBzaWduYWxCYXJzWzFdLm9wYWNpdHkgPSAxXG4gICAgICBzaWduYWxCYXJzWzFdLmJhY2tncm91bmRDb2xvciA9IFwid2hpdGVcIlxuICAgICAgc2lnbmFsQmFyc1syXS5vcGFjaXR5ID0gMVxuICAgICAgc2lnbmFsQmFyc1syXS5iYWNrZ3JvdW5kQ29sb3IgPSBcIndoaXRlXCJcbiAgICAgIHNpZ25hbEJhcnNbM10ub3BhY2l0eSA9IDFcbiAgICAgIHNpZ25hbEJhcnNbM10uYmFja2dyb3VuZENvbG9yID0gXCJ3aGl0ZVwiXG5cbiAgICBpZiBvcHRpb25zLnNpZ25hbFN0cmVuZ3RoID09IFwiZ29vZFwiXG4gICAgICBzaWduYWxCYXJzWzBdLm9wYWNpdHkgPSAxXG4gICAgICBzaWduYWxCYXJzWzBdLmJhY2tncm91bmRDb2xvciA9IFwid2hpdGVcIlxuICAgICAgc2lnbmFsQmFyc1sxXS5vcGFjaXR5ID0gMVxuICAgICAgc2lnbmFsQmFyc1sxXS5iYWNrZ3JvdW5kQ29sb3IgPSBcIndoaXRlXCJcbiAgICAgIHNpZ25hbEJhcnNbMl0ub3BhY2l0eSA9IDFcbiAgICAgIHNpZ25hbEJhcnNbMl0uYmFja2dyb3VuZENvbG9yID0gXCJ3aGl0ZVwiXG5cbiAgICBpZiBvcHRpb25zLnNpZ25hbFN0cmVuZ3RoID09IFwib2tcIlxuICAgICAgc2lnbmFsQmFyc1swXS5vcGFjaXR5ID0gMVxuICAgICAgc2lnbmFsQmFyc1swXS5iYWNrZ3JvdW5kQ29sb3IgPSBcIndoaXRlXCJcbiAgICAgIHNpZ25hbEJhcnNbMV0ub3BhY2l0eSA9IDFcbiAgICAgIHNpZ25hbEJhcnNbMV0uYmFja2dyb3VuZENvbG9yID0gXCJ3aGl0ZVwiXG5cbiAgICBpZiBvcHRpb25zLnNpZ25hbFN0cmVuZ3RoID09IFwiYmFkXCJcbiAgICAgIHNpZ25hbEJhcnNbMF0ub3BhY2l0eSA9IDFcbiAgICAgIHNpZ25hbEJhcnNbMF0uYmFja2dyb3VuZENvbG9yID0gXCJ3aGl0ZVwiXG5cbiAgICBpZiBvcHRpb25zLmJhclR5cGUgPT0gXCJkYXJrXCJcbiAgICAgIEAuYmFja2dyb3VuZENvbG9yID0gXCJibGFja1wiXG4gICAgICB0ZXh0Q29sb3IgPSBcIiNmZmZcIlxuICAgICAgaW5hY3RpdmVHcmF5ID0gaW5hY3RpdmVHcmF5XG5cblxuICAgIGlmIG9wdGlvbnMuYmFyVHlwZSA9PSBcImxpZ2h0XCJcbiAgICAgIEAuYmFja2dyb3VuZENvbG9yID0gbnVsbFxuICAgICAgdGV4dENvbG9yID0gXCIjMDAwXCJcbiIsIiMgQWRkIHRoZSBmb2xsb3dpbmcgbGluZSB0byB5b3VyIHByb2plY3QgaW4gRnJhbWVyIFN0dWRpby4gXG4jIG15TW9kdWxlID0gcmVxdWlyZSBcIm15TW9kdWxlXCJcbiMgUmVmZXJlbmNlIHRoZSBjb250ZW50cyBieSBuYW1lLCBsaWtlIG15TW9kdWxlLm15RnVuY3Rpb24oKSBvciBteU1vZHVsZS5teVZhclxuXG5leHBvcnRzLm15VmFyID0gXCJteVZhcmlhYmxlXCJcblxuZXhwb3J0cy5teUZ1bmN0aW9uID0gLT5cblx0cHJpbnQgXCJteUZ1bmN0aW9uIGlzIHJ1bm5pbmdcIlxuXG5leHBvcnRzLm15QXJyYXkgPSBbMSwgMiwgM10iLCIoZnVuY3Rpb24gZSh0LG4scil7ZnVuY3Rpb24gcyhvLHUpe2lmKCFuW29dKXtpZighdFtvXSl7dmFyIGE9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtpZighdSYmYSlyZXR1cm4gYShvLCEwKTtpZihpKXJldHVybiBpKG8sITApO3ZhciBmPW5ldyBFcnJvcihcIkNhbm5vdCBmaW5kIG1vZHVsZSAnXCIrbytcIidcIik7dGhyb3cgZi5jb2RlPVwiTU9EVUxFX05PVF9GT1VORFwiLGZ9dmFyIGw9bltvXT17ZXhwb3J0czp7fX07dFtvXVswXS5jYWxsKGwuZXhwb3J0cyxmdW5jdGlvbihlKXt2YXIgbj10W29dWzFdW2VdO3JldHVybiBzKG4/bjplKX0sbCxsLmV4cG9ydHMsZSx0LG4scil9cmV0dXJuIG5bb10uZXhwb3J0c312YXIgaT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2Zvcih2YXIgbz0wO288ci5sZW5ndGg7bysrKXMocltvXSk7cmV0dXJuIHN9KSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUdBQTtBRElBLE9BQU8sQ0FBQyxLQUFSLEdBQWdCOztBQUVoQixPQUFPLENBQUMsVUFBUixHQUFxQixTQUFBO1NBQ3BCLEtBQUEsQ0FBTSx1QkFBTjtBQURvQjs7QUFHckIsT0FBTyxDQUFDLE9BQVIsR0FBa0IsQ0FBQyxDQUFELEVBQUksQ0FBSixFQUFPLENBQVA7Ozs7QURUbEIsSUFBQSwrQkFBQTtFQUFBOzs7QUFBQSxZQUFBLEdBQWUsT0FBQSxDQUFRLGNBQVI7O0FBRWYsSUFBQSxHQUFXLElBQUEsSUFBQSxDQUFBOztBQUNYLFdBQUEsR0FBYztFQUFDLElBQUEsRUFBTSxTQUFQO0VBQWtCLE1BQUEsRUFBUSxTQUExQjs7O0FBRVIsT0FBTyxDQUFDO0FBR1osTUFBQTs7OztFQUFBLHlCQUFBLEdBQTRCOztFQUM1QixhQUFBLEdBQWdCLHlCQUFBLEdBQTRCOztFQUM1QyxnQkFBQSxHQUFtQjs7RUFDbkIsaUJBQUEsR0FBb0I7O0VBQ3BCLG1CQUFBLEdBQXNCLGdCQUFBLEdBQW1COztFQUN6QyxvQkFBQSxHQUF1QixpQkFBQSxHQUFvQjs7RUFDM0MsZUFBQSxHQUFrQjs7RUFDbEIsZ0JBQUEsR0FBbUI7O0VBQ25CLHFCQUFBLEdBQXdCLG1CQUFBLEdBQXNCLGVBQXRCLEdBQXdDLENBQUMsYUFBQSxHQUFjLENBQWY7O0VBQ2hFLHNCQUFBLEdBQXlCLG9CQUFBLEdBQXVCLENBQUMsYUFBQSxHQUFnQixFQUFqQjs7RUFDaEQsTUFBQSxHQUFTOztFQUNULFFBQUEsR0FBVzs7RUFDWCxVQUFBLEdBQWE7O0VBQ2IsWUFBQSxHQUFlOztFQUdGLHFCQUFDLE9BQUQ7QUFDWCxRQUFBO0lBQUEsNkNBQU0sQ0FBQyxDQUFDLFFBQUYsQ0FBVyxPQUFYLEVBQ0o7TUFBQSxNQUFBLEVBQVEsTUFBUjtNQUNBLEtBQUEsRUFBTyxHQURQO01BRUEsZUFBQSxFQUFpQixZQUFZLENBQUMsS0FGOUI7S0FESSxDQUFOO0lBS0EsSUFBQSxHQUFXLElBQUEsU0FBQSxDQUNUO01BQUEsSUFBQSxFQUFNLElBQUksQ0FBQyxjQUFMLENBQW9CLE9BQXBCLEVBQTZCLFdBQTdCLENBQU47TUFDQSxNQUFBLEVBQVEsSUFEUjtNQUVBLENBQUEsRUFBRyxLQUFLLENBQUMsTUFBTixDQUFBLENBRkg7TUFHQSxDQUFBLEVBQUcsS0FBSyxDQUFDLE1BQU4sQ0FBQSxDQUhIO01BSUEsS0FBQSxFQUFPLFNBSlA7TUFLQSxRQUFBLEVBQVUsUUFMVjtNQU1BLFVBQUEsRUFBWSxVQU5aO0tBRFM7SUFTWCxvQkFBQSxHQUF1QixPQUFPLENBQUMsYUFBUixJQUF5QjtJQUNoRCxXQUFBLEdBQWMsSUFBSSxDQUFDLEtBQUwsQ0FBVyxDQUFDLG9CQUFBLEdBQXdCLEdBQXpCLENBQUEsR0FBaUMsZ0JBQTVDO0lBRWQsbUJBQUEsR0FBMEIsSUFBQSxTQUFBLENBQ3hCO01BQUEsTUFBQSxFQUFRLElBQVI7TUFDQSxRQUFBLEVBQVUsUUFEVjtNQUVBLFVBQUEsRUFBWSxVQUZaO01BR0EsS0FBQSxFQUFPLFNBSFA7TUFJQSxJQUFBLEVBQU0sb0JBQUEsR0FBdUIsR0FKN0I7TUFLQSxDQUFBLEVBQUcsS0FBSyxDQUFDLE1BQU4sQ0FBQSxDQUxIO01BTUEsQ0FBQSxFQUFHLEtBQUssQ0FBQyxLQUFOLENBQVksQ0FBQyxDQUFFLEVBQUQsR0FBSyxxQkFBTixDQUFiLENBTkg7S0FEd0I7SUFTMUIsb0JBQUEsR0FBMkIsSUFBQSxLQUFBLENBQ3pCO01BQUEsTUFBQSxFQUFRLElBQVI7TUFDQSxJQUFBLEVBQU0sd0JBRE47TUFFQSxLQUFBLEVBQU8scUJBRlA7TUFHQSxNQUFBLEVBQVEsc0JBSFI7TUFJQSxDQUFBLEVBQUcsS0FBSyxDQUFDLE1BQU4sQ0FBQSxDQUpIO01BS0EsQ0FBQSxFQUFHLEtBQUssQ0FBQyxLQUFOLENBQVksQ0FBQyxDQUFiLENBTEg7TUFNQSxlQUFBLEVBQWlCLElBTmpCO01BT0EsWUFBQSxFQUFjLENBUGQ7S0FEeUI7SUFXM0IsVUFBQSxHQUFpQixJQUFBLEtBQUEsQ0FDZjtNQUFBLE1BQUEsRUFBUSxvQkFBUjtNQUNBLElBQUEsRUFBTSxhQUROO01BRUEsS0FBQSxFQUFPLEdBRlA7TUFHQSxNQUFBLEVBQVEsR0FIUjtNQUlBLGVBQUEsRUFBaUIsU0FKakI7TUFLQSxDQUFBLEVBQUcsS0FBSyxDQUFDLEtBQU4sQ0FBQSxDQUxIO01BTUEsQ0FBQSxFQUFHLEtBQUssQ0FBQyxNQUFOLENBQUEsQ0FOSDtLQURlO0lBVWpCLGVBQUEsR0FBc0IsSUFBQSxLQUFBLENBQ3BCO01BQUEsTUFBQSxFQUFRLG9CQUFSO01BQ0EsSUFBQSxFQUFNLGNBRE47TUFFQSxLQUFBLEVBQU8sZ0JBRlA7TUFHQSxNQUFBLEVBQVEsaUJBSFI7TUFJQSxlQUFBLEVBQWlCLElBSmpCO01BS0EsQ0FBQSxFQUFHLEtBQUssQ0FBQyxJQUFOLENBQVcsQ0FBWCxDQUxIO01BTUEsQ0FBQSxFQUFHLEtBQUssQ0FBQyxNQUFOLENBQUEsQ0FOSDtLQURvQjtJQVN0QixtQkFBQSxHQUEwQixJQUFBLEtBQUEsQ0FDeEI7TUFBQSxNQUFBLEVBQVEsZUFBUjtNQUNBLElBQUEsRUFBTSx1QkFETjtNQUVBLEtBQUEsRUFBTyxXQUZQO01BR0EsTUFBQSxFQUFRLGlCQUhSO01BSUEsZUFBQSxFQUFpQixTQUpqQjtLQUR3QjtJQVMxQixJQUFHLG9CQUFBLElBQXdCLEVBQTNCO01BQ0UsbUJBQW1CLENBQUMsZUFBcEIsR0FBc0MsTUFEeEM7O0lBR0EsY0FBQSxHQUFxQixJQUFBLEtBQUEsQ0FDbkI7TUFBQSxNQUFBLEVBQVEsb0JBQVI7TUFDQSxJQUFBLEVBQU0saUJBRE47TUFFQSxLQUFBLEVBQU8sbUJBQUEsR0FBc0IsYUFGN0I7TUFHQSxNQUFBLEVBQVEsb0JBQUEsR0FBdUIsYUFIL0I7TUFJQSxXQUFBLEVBQWEsQ0FKYjtNQUtBLFdBQUEsRUFBYSxTQUxiO01BTUEsZUFBQSxFQUFpQixJQU5qQjtNQU9BLFlBQUEsRUFBYyxHQVBkO01BUUEsQ0FBQSxFQUFHLEtBQUssQ0FBQyxJQUFOLENBQUEsQ0FSSDtNQVNBLENBQUEsRUFBRyxLQUFLLENBQUMsTUFBTixDQUFBLENBVEg7S0FEbUI7SUFZckIsU0FBQSxHQUFZLENBQUUsQ0FBRixFQUFLLENBQUwsRUFBUSxDQUFSLEVBQVcsRUFBWDtJQUVaLGVBQUEsR0FBc0IsSUFBQSxLQUFBLENBQ3BCO01BQUEsTUFBQSxFQUFRLElBQVI7TUFDQSxLQUFBLEVBQU8sRUFEUDtNQUVBLE1BQUEsRUFBUSxFQUZSO01BR0EsQ0FBQSxFQUFHLEtBQUssQ0FBQyxJQUFOLENBQVcsRUFBWCxDQUhIO01BSUEsQ0FBQSxFQUFHLEtBQUssQ0FBQyxNQUFOLENBQUEsQ0FKSDtNQUtBLGVBQUEsRUFBaUIsSUFMakI7S0FEb0I7SUFRdEIsVUFBQSxHQUFZO0FBRVosU0FBUyx5QkFBVDtNQUNFLFNBQUEsR0FBZ0IsSUFBQSxLQUFBLENBQ2Q7UUFBQSxNQUFBLEVBQVEsZUFBUjtRQUNBLEtBQUEsRUFBTyxDQURQO1FBRUEsTUFBQSxFQUFRLFNBQVUsQ0FBQSxDQUFBLENBRmxCO1FBR0EsZUFBQSxFQUFpQixZQUhqQjtRQUlBLFlBQUEsRUFBYyxJQUpkO1FBS0EsQ0FBQSxFQUFHLEtBQUssQ0FBQyxJQUFOLENBQVcsQ0FBQyxDQUFBLEdBQUksQ0FBTCxDQUFBLEdBQVUsQ0FBckIsQ0FMSDtRQU1BLENBQUEsRUFBRyxLQUFLLENBQUMsTUFBTixDQUFBLENBTkg7T0FEYztNQVNoQixVQUFVLENBQUMsSUFBWCxDQUFnQixTQUFoQjtBQVZGO0lBYUEsSUFBRyxPQUFPLENBQUMsY0FBUixLQUEwQixTQUE3QjtNQUNFLFVBQVcsQ0FBQSxDQUFBLENBQUUsQ0FBQyxPQUFkLEdBQXdCO01BQ3hCLFVBQVcsQ0FBQSxDQUFBLENBQUUsQ0FBQyxlQUFkLEdBQWdDO01BQ2hDLFVBQVcsQ0FBQSxDQUFBLENBQUUsQ0FBQyxPQUFkLEdBQXdCO01BQ3hCLFVBQVcsQ0FBQSxDQUFBLENBQUUsQ0FBQyxlQUFkLEdBQWdDO01BQ2hDLFVBQVcsQ0FBQSxDQUFBLENBQUUsQ0FBQyxPQUFkLEdBQXdCO01BQ3hCLFVBQVcsQ0FBQSxDQUFBLENBQUUsQ0FBQyxlQUFkLEdBQWdDO01BQ2hDLFVBQVcsQ0FBQSxDQUFBLENBQUUsQ0FBQyxPQUFkLEdBQXdCO01BQ3hCLFVBQVcsQ0FBQSxDQUFBLENBQUUsQ0FBQyxlQUFkLEdBQWdDLFFBUmxDOztJQVVBLElBQUcsT0FBTyxDQUFDLGNBQVIsS0FBMEIsTUFBN0I7TUFDRSxVQUFXLENBQUEsQ0FBQSxDQUFFLENBQUMsT0FBZCxHQUF3QjtNQUN4QixVQUFXLENBQUEsQ0FBQSxDQUFFLENBQUMsZUFBZCxHQUFnQztNQUNoQyxVQUFXLENBQUEsQ0FBQSxDQUFFLENBQUMsT0FBZCxHQUF3QjtNQUN4QixVQUFXLENBQUEsQ0FBQSxDQUFFLENBQUMsZUFBZCxHQUFnQztNQUNoQyxVQUFXLENBQUEsQ0FBQSxDQUFFLENBQUMsT0FBZCxHQUF3QjtNQUN4QixVQUFXLENBQUEsQ0FBQSxDQUFFLENBQUMsZUFBZCxHQUFnQyxRQU5sQzs7SUFRQSxJQUFHLE9BQU8sQ0FBQyxjQUFSLEtBQTBCLElBQTdCO01BQ0UsVUFBVyxDQUFBLENBQUEsQ0FBRSxDQUFDLE9BQWQsR0FBd0I7TUFDeEIsVUFBVyxDQUFBLENBQUEsQ0FBRSxDQUFDLGVBQWQsR0FBZ0M7TUFDaEMsVUFBVyxDQUFBLENBQUEsQ0FBRSxDQUFDLE9BQWQsR0FBd0I7TUFDeEIsVUFBVyxDQUFBLENBQUEsQ0FBRSxDQUFDLGVBQWQsR0FBZ0MsUUFKbEM7O0lBTUEsSUFBRyxPQUFPLENBQUMsY0FBUixLQUEwQixLQUE3QjtNQUNFLFVBQVcsQ0FBQSxDQUFBLENBQUUsQ0FBQyxPQUFkLEdBQXdCO01BQ3hCLFVBQVcsQ0FBQSxDQUFBLENBQUUsQ0FBQyxlQUFkLEdBQWdDLFFBRmxDOztJQUlBLElBQUcsT0FBTyxDQUFDLE9BQVIsS0FBbUIsTUFBdEI7TUFDRSxJQUFDLENBQUMsZUFBRixHQUFvQjtNQUNwQixTQUFBLEdBQVk7TUFDWixZQUFBLEdBQWUsYUFIakI7O0lBTUEsSUFBRyxPQUFPLENBQUMsT0FBUixLQUFtQixPQUF0QjtNQUNFLElBQUMsQ0FBQyxlQUFGLEdBQW9CO01BQ3BCLFNBQUEsR0FBWSxPQUZkOztFQTVJVzs7OztHQW5CbUI7Ozs7QURMbEMsT0FBTyxDQUFDLEtBQVIsR0FBZ0I7O0FBQ2hCLE9BQU8sQ0FBQyxLQUFSLEdBQWdCIn0=

statusColors = require "statusColors"

date = new Date();
timeOptions = {hour: '2-digit', minute: '2-digit' };

class exports.standardBar extends Layer


  batteryOutlineBorderWidth = 1
  batterySpacer = batteryOutlineBorderWidth * 2
  batteryFillWidth = 20
  batteryFillHeight = 7.5
  batteryOutlineWidth = batteryFillWidth + batterySpacer
  batteryOutlineHeight = batteryFillHeight + batterySpacer
  batteryNubWidth = 1.5
  batteryNubHeight = 3.5
  batteryContainerWidth = batteryOutlineWidth + batteryNubWidth + (batterySpacer*2)
  batteryContainerHeight = batteryOutlineHeight + (batterySpacer + .5)
  height = 20
  textSize = 12
  textFamily = "arial"
  inactiveGray = "rgba(255,255,255,0.4)"


  constructor: (options) ->
    super _.defaults options,
      height: height
      width: 375
      backgroundColor: statusColors.black

    time = new TextLayer
      text: date.toLocaleString('en-US', timeOptions)
      parent: @
      x: Align.center()
      y: Align.center()
      color: textColor
      fontSize: textSize
      fontFamily: textFamily

    batteryChargePercent = options.chargePercent || 66
    batteryFill = Math.floor((batteryChargePercent / (100)) * batteryFillWidth)

    batterChargePercent = new TextLayer
      parent: @
      fontSize: textSize
      fontFamily: textFamily
      color: textColor
      text: batteryChargePercent + "%"
      y: Align.center()
      x: Align.right(-((13)+batteryContainerWidth))

    batteryIconContainer = new Layer
      parent: @
      name: "Battery Icon Container"
      width: batteryContainerWidth
      height: batteryContainerHeight
      y: Align.center()
      x: Align.right(-8)
      backgroundColor: null
      borderRadius: 2

    # Battery Full Container - Transparent
    batteryNub = new Layer
      parent: batteryIconContainer
      name: "Battery Nub"
      width: 1.5
      height: 3.5
      backgroundColor: textColor
      x: Align.right()
      y: Align.center()

    # Battery Full Container - Transparent
    batteryFillClip = new Layer
      parent: batteryIconContainer
      name: "Battery Fill"
      width: batteryFillWidth
      height: batteryFillHeight
      backgroundColor: null
      x: Align.left(2)
      y: Align.center()

    batteryFillProgress = new Layer
      parent: batteryFillClip
      name: "Battery Fill Progress"
      width: batteryFill
      height: batteryFillHeight
      backgroundColor: textColor
      # x: Align.left(2)
      # y: Align.center()

    if batteryChargePercent <= 10
      batteryFillProgress.backgroundColor = "red"

    batteryOutline = new Layer
      parent: batteryIconContainer
      name: "Battery Outline"
      width: batteryOutlineWidth + batterySpacer
      height: batteryOutlineHeight + batterySpacer
      borderWidth: 1
      borderColor: textColor
      backgroundColor: null
      borderRadius: 2.5
      x: Align.left()
      y: Align.center()

    barHeight = [ 4, 6, 8, 10]

    signalContainer = new Layer
      parent: @
      width: 15
      height: 10
      x: Align.left(10)
      y: Align.center()
      backgroundColor: null

    signalBars =[]

    for i in [0...4]
      signalBar = new Layer
        parent: signalContainer
        width: 3
        height: barHeight[i]
        backgroundColor: inactiveGray
        borderRadius: 0.75
        x: Align.left((3 + 1) * i)
        y: Align.bottom()

      signalBars.push signalBar


    if options.signalStrength == "perfect"
      signalBars[0].opacity = 1
      signalBars[0].backgroundColor = "white"
      signalBars[1].opacity = 1
      signalBars[1].backgroundColor = "white"
      signalBars[2].opacity = 1
      signalBars[2].backgroundColor = "white"
      signalBars[3].opacity = 1
      signalBars[3].backgroundColor = "white"

    if options.signalStrength == "good"
      signalBars[0].opacity = 1
      signalBars[0].backgroundColor = "white"
      signalBars[1].opacity = 1
      signalBars[1].backgroundColor = "white"
      signalBars[2].opacity = 1
      signalBars[2].backgroundColor = "white"

    if options.signalStrength == "ok"
      signalBars[0].opacity = 1
      signalBars[0].backgroundColor = "white"
      signalBars[1].opacity = 1
      signalBars[1].backgroundColor = "white"

    if options.signalStrength == "bad"
      signalBars[0].opacity = 1
      signalBars[0].backgroundColor = "white"

    if options.barType == "dark"
      @.backgroundColor = "black"
      textColor = "#fff"
      inactiveGray = inactiveGray


    if options.barType == "light"
      @.backgroundColor = null
      textColor = "#000"

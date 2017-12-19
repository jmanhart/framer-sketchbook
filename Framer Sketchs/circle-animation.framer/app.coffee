bkg = new BackgroundLayer
	backgroundColor: 'red'

bkgColor = 'rgba(255, 255, 255, 1)'

spacer = 20

trigger = new Layer
	width: 200
	height: 100
	x: Align.center()
	y: Align.top(spacer)
	backgroundColor: 'white'

circleH = 150
circleW = 150



# class textInput extends Layer
# 	constructor: (options) ->
# 		super _.defaults options,
# 			x: Align.center()
# 			y: Align.center()
# 			width: Screen.width - (spacer*2)
# 			height: 60
# 			borderWidth: 2
# 			borderColor: 'white'
# 			backgroundColor: null
# 			html: "sample string"
# 			style:
# 				"font-size":"0.75em"
# 				"display":"flex"
# 				"align-items":"center"
# 				"justify-content":"flex-start"
# 				"padding":"0em 1em"

class circle extends Layer 
	constructor: (options) ->
		super _.defaults options,
			x: Align.center()
			y: Align.bottom()
			height: 100
			width: 100

dude = new circle


circleWrapper = new Layer
	x: Align.center()
	y: Align.center()
	height: circleH
	width: circleW
	backgroundColor: null
	clip: true

# Outer
outerCircleContainer = new Layer
	parent: circleWrapper
	x: Align.left()
	y: Align.center()
	height: circleH
	width: circleW / 2
	backgroundColor: null
	clip: true

outerCircle = new Layer
	parent: outerCircleContainer
	x: Align.left()
	y: Align.center()
	borderWidth: 8
	borderColor: 'black'
	borderRadius: 100
	height: circleH
	width: circleW
	backgroundColor: null


# Iner
innerCircleContainer = new Layer
	parent: circleWrapper
	x: Align.center(circleW / 8)
	y: Align.center()
	height: circleH
	width: circleW / 4
	backgroundColor: null
	clip: true

innerCircle = new Layer
	parent: innerCircleContainer
	x: Align.right()
	y: Align.center()
	borderWidth: 8
	borderColor: 'black'
	borderRadius: 100
	height: circleH / 2
	width: circleW / 2 
	backgroundColor: 'pink'



rotate = new Animation innerCircle,
	rotation: 360
	opacity: 1
	options:
		repeat: 5

rotate2 = new Animation outerCircle,
	rotation: 360
	opacity: 1
	options:
		repeat: 5

trigger.onTap ->
	rotate.start()
	rotate2.start()
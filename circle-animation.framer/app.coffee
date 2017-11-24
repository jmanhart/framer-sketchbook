bkg = new BackgroundLayer
	backgroundColor: 'red'

bkgColor = 'rgba(255, 255, 255, 1)'

circleH = 150
circleW = 150

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

circle = new Layer
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

circle = new Layer
	parent: innerCircleContainer
	x: Align.right()
	y: Align.center()
	borderWidth: 8
	borderColor: 'black'
	borderRadius: 100
	height: circleH / 2
	width: circleW / 2 
	backgroundColor: null



rotate = new Animation circleWrapper,
	rotation: 360
	opacity: 1
	options:
		repeat: 5

rotate2 = new Animation circle,
	rotation: -360
	opacity: 1
	options:
		repeat: 5

circleWrapper.onTap ->
	rotate.start()
	rotate2.start()
# Dribbble Setup
screenFrameWidth = 375
screenFrameHeight = 525
screenFrameBackgroundColor = 'rgba(255,255,255,1)'

# Background Layer
backgroundLayer = new BackgroundLayer
	backgroundColor: 'teal'

# Screen Frame 
screenFrame = new Layer
	width: screenFrameWidth
	height: screenFrameHeight
	backgroundColor: screenFrameBackgroundColor
	x: Align.center()
	y: Align.bottom()
	

spacer = 20
sideMenuOpenWidth = screenFrame.width
hamburgerLines = []

# Hamburger Components
oval = new Layer
	parent: screenFrame
	size: 44
	borderRadius: 44
	x: Align.left(spacer)
	y: Align.top(spacer)
	clip: true
	
oval.states =
	opened:
		x: Align.right(-spacer)

for i in [0...4]	
	hamburgerLine = new Layer
		parent: oval
		name: "Line #{i + 1}"
		width: 25
		height: 3
		borderRadius: 25
		backgroundColor: 'black'
		x: Align.center()
		
	hamburgerLine.states =
		opened:
			rotation: -45
		openedOp:
			rotation: 45
		closed:
			rotation: 0
		exitLeft:
			x:Align.left(-25)
		exitRight:
			x:Align.right(25)
		reset:
			x: Align.center()
		
	hamburgerLines.push hamburgerLine
	
hamburgerLines[0].y = Align.center(spacer/3)
hamburgerLines[1].y = Align.center()
hamburgerLines[2].y = Align.center()
hamburgerLines[3].y = Align.center(-(spacer/3))

# Side Menu
sideMenuContainer = new Layer
	parent: screenFrame
	width: 0
	height: screenFrame.height
	
sideMenuContainer.states =
	open:
		width: sideMenuOpenWidth
		


oval.onTap ->
	sideMenuContainer.stateCycle()
	oval.stateCycle()
	hamburgerLines[0].stateCycle("exitLeft","reset")
	hamburgerLines[1].stateCycle("opened","closed")
	hamburgerLines[2].stateCycle("openedOp","closed")
	hamburgerLines[3].stateCycle("exitRight","reset")
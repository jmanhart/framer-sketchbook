bkg = new BackgroundLayer
	backgroundColor: "#121212"
	
spacer = 16

buttonColor = "#11A9ED"
overlayColor = "#3A3A3A"
overlayHeight = 88
overlayChevronSize = 35
contentWidth = Screen.width - (spacer*2)

dummyCount = 6

dummyContainer = new Layer
	width: Screen.width
	height: Screen.height - (44 + (spacer*2))
	rotation: 180
	backgroundColor: null
	
screenOverlay = new Layer
	width: Screen.width
	height: Screen.height
	rotation: 180
	backgroundColor: 'rgba(0,0,0,0.0)'
	
screenOverlay.states =
	end:
		backgroundColor: 'rgba(0,0,0,0.4)'

for i in [0..dummyCount]
	dummyItem = new Layer
		parent: dummyContainer
		width: contentWidth
		height: 145
		borderRadius: 8
		x: Align.center()
		y: Align.top(((145 + spacer) * i))

buttonString = "Add Data to My Day"

button = new Layer
	height: 44
	width: contentWidth
	backgroundColor: buttonColor
	x: Align.center()
	y: Align.bottom(-spacer)
	borderRadius: 16
	
buttonString = new TextLayer
	parent: button
	text: buttonString
	x: Align.center(spacer)
	y: Align.center(-1)
	fontSize: 15
	color: 'rgba(255,255,255,1)'
	
buttonIcon.parent = button
buttonIcon.y = Align.center()
buttonIcon.x = Align.center(-((buttonString.width/2) + 4))

# Overlay Positioning
overlayEndPosition = button.y - overlayHeight - (overlayChevronSize/2) - spacer
overlayStartPosition = button.y

overlayContainer = new Layer
	width: Screen.width
	height: Screen.height - button.height - spacer
	backgroundColor: null
	y: Align.top()
	clip: true

overlay = new Layer
	parent: overlayContainer
	width: contentWidth
	height: overlayHeight
	backgroundColor: overlayColor
	borderRadius: 10
	x: Align.center()
	y: overlayStartPosition
	opacity: 1
	scale: 0.8
	
overlayChevron = new Layer
	parent: overlay
	size: overlayChevronSize
	backgroundColor: overlayColor
	x: Align.center()
	y: Align.bottom(0)
	rotation: 45



overLayContent.parent = overlay
overLayContent.y = Align.center()
overLayContent.x = Align.center()
overLayContent.opacity = 0


# State Managment
overlay.states =
	end:
		y: overlayEndPosition
		opacity: 1
		scale: 1
		
overlayChevron.states =
	end:
		y: Align.bottom(15)
		opacity: 1

overLayContent.states =
	end:
		opacity: 1

buttonIconPlus.states =
	end:
		rotation: 45
		scale: 1.25
		
buttonIconOval.states =
	end:
		opacity: 0
	



# Animation Options
overlay.animationOptions =
	time: 0.50
	curve: Spring(damping: 0.8)

overlayChevron.animationOptions = overlay.animationOptions
overLayContent.animationOptions = overlay.animationOptions
buttonIconPlus.animationOptions = overlay.animationOptions
buttonIconOval.animationOptions = overlay.animationOptions
screenOverlay.animationOptions =
	time: 0.15
	curve: Spring(damping: 0.8)

button.onTap ->
	overlay.stateCycle()
	overlayChevron.stateCycle()
	overLayContent.stateCycle()
	
	buttonIconPlus.stateCycle()
	buttonIconOval.stateCycle()
	
	screenOverlay.stateCycle()
	
	
	
	
	
overlay.sendToBack()	
bkg.sendToBack()
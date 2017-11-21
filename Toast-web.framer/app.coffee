bkg = new BackgroundLayer
	backgroundColor:'black'
	
	
spacer = 15
FPOfontSize = 12

buttonWidthInactive = 175
buttonWidthActive = 300

buttonHeightInactive = 50
buttonHeightActive = 455

buttonBorderRadius = 4

# Makes the button expand but centered still!
buttonActiveX = ((buttonWidthActive - buttonWidthInactive) / 2)
buttonActiveY = buttonHeightActive - buttonHeightInactive

# Classes
class chevron extends Layer
	constructor: (options) ->
		super _.defaults options,
			size: 12
			backgroundColor: null
			shadowColor: 'rgba(0,0,0,0.3)'
			shadowX: 2
			shadowY: -2
			rotation: 45
			

buttonContainer = new Layer
	x: Align.center()
	y: Align.bottom()
# 	height: buttonHeightInactive
# 	width: buttonWidthInactive
	height: buttonHeightActive
	width: buttonWidthActive
	backgroundColor: 'white'
	borderRadius: "#{buttonBorderRadius}px #{buttonBorderRadius}px 0px 0px"
	clip: true


	

buttonTitle = new Layer
	parent: buttonContainer
	width: 80
	height: FPOfontSize
	borderRadius: 1
	x: Align.center()
	y: Align.top((buttonHeightInactive/2) - FPOfontSize/2)
	
buttonClose = new Layer
	parent: buttonContainer
	size: 30
	opacity: 0
	x: Align.right(-spacer)
	y: Align.top((buttonHeightInactive/2) - 30/2)

expandedContainer = new ScrollComponent
	parent: buttonContainer
	y: buttonHeightInactive
	height: buttonHeightActive - buttonHeightInactive
	width: buttonWidthActive
	scrollHorizontal: false

# Pages 
# pageOne = new Layer
# 	parent: expandedContainer
# 	height: buttonHeightActive - buttonHeightInactive
# 	width: buttonWidthActive
# 	backgroundColor: null
# flow = new FlowComponent
# 
# flow.showNext(pageOne)


scrollItemHeight = 70

for i in [0...20]
	scrollItem = new Layer
		parent: expandedContainer.content
		height: scrollItemHeight
		y: scrollItemHeight * i
		width: buttonWidthActive
		backgroundColor: 'rgba(0,0,0,0.05)'
		shadowY: 1
	line = new Layer
		parent: scrollItem
		height: FPOfontSize
		width: Utils.randomNumber(100, 200)
		y: Align.center
		x: Align.left(spacer)
	dude = new chevron
		parent: scrollItem
		x: Align.right(-spacer*1.5)
		y: Align.center()


	
	
	
	
	
	
	
	
buttonContainer.states =
	active:
		width:buttonWidthActive
		height:buttonHeightActive
		x: Align.center(-(buttonActiveX))
		y: Align.bottom(-buttonActiveY)

buttonTitle.states =
	active:
		x: Align.center((buttonActiveX))
		
buttonClose.states =
	active:
		x: Align.right((buttonWidthActive - buttonWidthInactive) - spacer)
		opacity: 1
		
expandedContainer.states = 
	active:
		y: buttonHeightInactive
		height: buttonHeightActive - buttonHeightInactive
		width: buttonWidthActive
		backgroundColor: 'rgba(0,0,0,0.15)'

buttonTitle.onTap ->
	buttonContainer.stateCycle()
	buttonTitle.stateCycle()
	buttonClose.stateCycle()
	
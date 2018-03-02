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
	

screenScroll = new ScrollComponent
	parent: screenFrame
	size: screenFrame
	scrollHorizontal: false

screenScroll.contentInset =
	top: 250
	bottom: 100

timelineColor = "#E3E3E3"
timelineEntryHeight = 250
spacer = 20

for i in [0...8]
	timelineEntry = new Layer
		parent: screenScroll.content
		width: screenScroll.width
		height: timelineEntryHeight
		y: i * timelineEntryHeight
		backgroundColor: null
		clip: false
		
	timelineBar = new Layer
		parent: timelineEntry
		width: 2
		height: timelineEntryHeight
		x: Align.left(spacer*1.5)
		backgroundColor: timelineColor
		opacity: 1
			 
	timelineCardEntry = new Layer
		parent: timelineEntry	
# 		x: Align.left(spacer*2.35)
		x: Align.center
		borderRadius: 10
		height: timelineEntryHeight - spacer
		width: 350
		backgroundColor: 'white'
		shadowY: 0
		shadowBlur: 5
		shadowSpread: 0
		shadowColor: 'rgba(0,0,0,0.1)'
		borderWidth: 2
		borderColor: timelineColor
		
	timelineTopCap = new Layer
		parent: timelineCardEntry
		size: 14
		borderRadius: 20
		x: Align.left(13)
		y: Align.top(14)
		backgroundColor: null
		opacity: 1
		borderWidth: 2
		borderColor: timelineColor
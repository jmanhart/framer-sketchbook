bkgColor = "#EBEBEB"

bkgLayer = new BackgroundLayer
	backgroundColor: bkgColor
	
	
spacer = 20
itemContainerHeight = 350
timeLineColor = 'rgba(0,0,0,0.1)'


# Timeline Build
timeLine = new Layer
	width: 2
	height: Screen.height
	x: Align.left(spacer)
	backgroundColor: timeLineColor

# Scroll Component
timelineScroll = new ScrollComponent
	size: Screen.size
	scrollHorizontal: false
	
timelineScroll.contentInset =
	top: 200


for i in [0...5]
	itemContainer = new Layer
		parent: timelineScroll.content
		width: Screen.width
		height: itemContainerHeight
		y: Align.top(i * itemContainerHeight)
		backgroundColor: 'rgba(0,0,0,0.0)'
	
	# Dot indicator Outer ring	
	itemTimelineOuterDot = new Layer
		parent: itemContainer
		size: spacer
		backgroundColor: bkgColor
		borderRadius: spacer
		x: Align.left(spacer/1.75)
		y: Align.top(spacer/2)
	
	# Dot indicator Inner ring
	itemTimelineOutterDot = new Layer
		parent: itemTimelineOuterDot
		size: 6
		backgroundColor: timeLineColor
		borderRadius: spacer
		x: Align.center()
		y: Align.center()
		
	itemTimelineLabel = new TextLayer
		parent: itemContainer
		x: Align.left(spacer*2)
		y: Align.top(spacer/2)
		fontSize: 18
		text: "Item Label"
	
	# Card Container for Content
	itemCardContainer = new Layer
		parent: itemContainer
		x: Align.left(spacer*2)
		y: Align.top(spacer*2.5)
		width: Screen.width - (spacer*3)
		height: itemContainerHeight - (spacer*4)
		backgroundColor: 'white'
		borderRadius: 4
		shadow1: 
			color: 'rgba(0,0,0,0.2)'
			y: 1 
			blur: 2
		
		
		
		
		
	
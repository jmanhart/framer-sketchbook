graphContainerHeight = 300
graphContentWidth = 1200 
spacer = 20

color01 = 'rgba(255,255,255,0.09)'
color02 = 'rgba(255,255,255,0.15)'


yAxisLabelStrings = ["100%", "90%", "80%", "70%"]
xDividers = [
	{
		label: "1am"
	}
	{
		label: "2am"
	}
	{
		label: "3am"
	}
	{
		label: "4am"
	}
	{
		label: "5am"
	}
	{
		label: "6am"
	}
]


# Setting up Graph Side Scroll
graphScroll = new ScrollComponent
	height: graphContainerHeight
	width: Screen.width
	scrollVertical: false
	backgroundColor: color01
	clip: false
	x: Align.center()
	y: Align.center()

graphScroll.contentInset =
	top: 0
	right: (spacer*2)
	bottom: 0
	left: (spacer*2)
	
# Setting up graph content
graphContent = new Layer
	parent: graphScroll.content
	backgroundColor: color01
	height: graphContainerHeight 
	width: graphContentWidth
	clip: false

# Creating and Link the y Axis
for i in [0...yAxisLabelStrings.length]
	yAxisContainer = new Layer
		parent: graphScroll
		width: graphScroll.contentInset.left
		height: graphScroll.height / yAxisLabelStrings.length
		y: i*(graphScroll.height / yAxisLabelStrings.length)
		backgroundColor: null
	
	yAxisLabel = new TextLayer
		parent: yAxisContainer
		fontSize: 12
		text: yAxisLabelStrings[i]
		x: Align.center()
		y: Align.center()
		
stops = 5

# Creating and Link the x Axis
for i in [0...xDividers.length]
	xAxisDivider = new Layer
		parent: graphContent
		height: (graphContent.height)
		width: 2
		backgroundColor: color02
		y: Align.top()
		x: (i * (graphContentWidth/(stops-1)))
		clip: false
		
	xAxisLabel = new TextLayer
		parent: xAxisDivider
		fontSize: 12
		x: Align.center()
		y: Align.bottom(spacer)






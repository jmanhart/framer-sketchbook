graphContainerHeight = 300
spacer = 20

graphContentWidth = Screen.width *2

color01 = 'rgba(255,255,255,0.09)'
color02 = 'rgba(255,255,255,0.15)'

graphScroll = new ScrollComponent
	height: graphContainerHeight
	width: Screen.width
	scrollVertical: false
	backgroundColor: color01
	x: Align.center()
	y: Align.center()

graphScroll.contentInset =
	top: 0
	right: (spacer*2)
	bottom: 0
	left: (spacer*2)


graphContent = new Layer
	parent: graphScroll.content
	backgroundColor: color01
	height: graphContainerHeight 
	width: graphContentWidth
	
xBaseLine = new Layer
	parent: graphContent
	height: 2
	width: graphContent.width
	backgroundColor: color02
	y: Align.bottom(-spacer)

yAxisLabelStrings = ["100%", "90%", "80%", "70%"]

for i in [0...4]
	yAxisLabelContainer = new Layer
		parent: graphScroll
		backgroundColor: null
		width: spacer*2
		height: (graphContent.height/4)
		x: Align.left()
		y: i * (graphContent.height/4)
		
	yAxisLabel = new TextLayer
		parent: yAxisLabelContainer
		fontSize: 11
		text: yAxisLabelStrings[i]
		backgroundColor: 'black'
		x: Align.center()
		y: Align.center()
		
		
stops = 5

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
		
for i in [0...xDividers.length]
	xLineIndy = new Layer
		parent: graphContent
		height: (graphContent.height-(spacer))
		width: 2
		backgroundColor: color02
		y: Align.top()
		x: (spacer/2) + (i * (graphContentWidth/(stops-1)))
		
	xLineIndyLabel = new TextLayer
		parent: xLineIndy
		fontSize: 11
		text: xDividers[i].label
		y: Align.bottom(spacer/1.25)
		x: Align.center


for i in [0...graphContentWidth]
	graphLine = new Layer	
		width: 1
		height: Utils.randomNumber(25,50)
		parent: graphContent
		x: i * 1
	
	
	
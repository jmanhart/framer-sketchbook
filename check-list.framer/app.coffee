screenFrame = new Layer
	size: Screen.size
	backgroundColor: 'white'

itemHeight = 60
spacer = 20


trigger = new Layer
	y: Align.bottom()
	x: Align.center()
	height: 80


listData = [
	{
		label: "Fart"
	},
	{
		label: "Eatttt"
	},
	{
		label: "Pooooop"
	}
]



for i in [0...listData.length]
	itemWrapper = new Layer
		parent: screenFrame
		width: screenFrame.width
		height: itemHeight
		y: Align.center(100 - (itemHeight*i))
		
	checkContainer = new Layer
		size: itemWrapper.height
		parent: itemWrapper
		
	check = new Layer
		parent: checkContainer
		size: checkContainer.width/2
		borderRadius: spacer
		x: Align.center()
		y: Align.center()
		
	crossLine = new Layer
		parent: itemWrapper
		x: check.x
		y:Align.center()
		height: 3
		width: check.width
	
	itemLabel = new TextLayer
		text:listData[i].label
		parent: itemWrapper
		fontSize: 16
		y:Align.center()
		x: checkContainer.width + spacer

	crossLine.states =
		crossed:
			width: itemLabel.width
			x: itemLabel.x
			
	crossLine.animationOptions =
		curve: Spring(damping: 0.85)
	
	do(crossLine) ->
		checkContainer.onTap ->
			crossLine.stateCycle()
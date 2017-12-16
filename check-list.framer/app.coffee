bkg = new BackgroundLayer
	backgroundColor: '#555555'
screenFrame = new Layer
	width: 375
	height: Screen.height
	backgroundColor: 'white'
	x:Align.center()
	x:Align.center()

itemHeight = 48
itemWidth = 200
spacer = 20
checkMarkThickness = 3

# Color
fpoColor = 'rgba(0,0,0,0.0)'

dark01 = '#444444'
dark02 = '#777777'
dark03 = '#DBDBDB'

light01 = 'rgba(255,255,255,1)'
light02 = '#DDDDDD'
active01 = "#4BDE95"
listData = [
	{
		label: "Drink"
	},
	{
		label: "Pour"
	},
	{
		label: "Bloom"
	},
	{
		label: "Grind Coffee"
	},
	{
		label: "Weigh Coffee"
	}
]



for i in [0...listData.length]

	# Wrapper - for each list Item
	itemWrapper = new Layer
		parent: screenFrame
		width: (screenFrame.width - (spacer*2))
		height: itemHeight
		y: Align.center(100 - (itemHeight*i))
		x: Align.center()
		backgroundColor: fpoColor
		
	# Container - for the checkmark pieces
	checkContainer = new Layer
		size: itemWrapper.height
		parent: itemWrapper
		backgroundColor: fpoColor
			
	# Styling - of the actual checkmark box
	check = new Layer
		name: "checkbox-style"
		parent: checkContainer
		size: checkContainer.width/2.45
		backgroundColor: null
		borderWidth: checkMarkThickness/1.5
		borderColor: dark03
		borderRadius: 4
		x: Align.center()
		y: Align.center()
		
	# Component - Checkmark Container
	checkMarkContainer = new Layer
		name: "checkmark-container"
		parent: checkContainer
		size: checkContainer.width/4.0
		x: Align.center(-1)
		y: Align.center(-3.5)
		rotation: -45
		opacity: 0
		backgroundColor: 'rgba(0,0,0,0.0)'

	# Component - Checkmark pieces (Long)
	checkLineLong = new Layer
		name: "checkmark-long"
		parent: checkMarkContainer
		x:Align.right()
		y:Align.bottom()
		height: checkMarkThickness
		width: checkMarkContainer.width
		backgroundColor: active01
		borderRadius: 1.15
		
	# Component - Checkmark pieces (Short)
	checkLineShort = new Layer
		name: "checkmark-short"
		parent: checkMarkContainer
		x:Align.left() 
		y:Align.bottom()
		height: checkMarkContainer.width/1.65
		width: checkMarkThickness
		backgroundColor: active01
		borderRadius: 1.15
	
	itemLabel = new TextLayer
		text:listData[i].label
		parent: itemWrapper
		fontSize: 18
		color: dark01
		y:Align.center()
		x: checkContainer.width 
		
	# Styling - Strike through line
	crossLine = new Layer
		parent: itemWrapper
		x: check.x
		y:Align.center()
		height: checkMarkThickness/1.5
		width: check.width
		backgroundColor: active01
		opacity: 0
		
	# Container - for the override
	overFlowContainer = new Layer
		height: itemWrapper.height
		width: (5*3)+(3*2)
		parent: itemWrapper
		x:Align.right()
		backgroundColor: null
	
	overFlowMenu = new Layer
		backgroundColor: 'rgba(0,0,0,0.6)'
		parent: itemWrapper
		x: Align.right(0)
		y: Align.top(20)
		opacity: 1
		scale: 1
		height: 130
		width: 100
			
	for i in [0...3]
		overflowDot = new Layer
			parent: overFlowContainer
			size: 5
			borderRadius: 20
			y:Align.center()
			x: Align.left(8*i)
			backgroundColor: dark03

	# State MGMT
	crossLine.states =
		crossed:
			width: itemLabel.width
			x: itemLabel.x
			opacity: 1

	checkMarkContainer.states =
		crossed:
			opacity: 1
			scale: 1.1
	
	check.states =
		crossed:
			borderColor:'rgba(0,0,0,0)'
			
	itemLabel.states =
		crossed:
			color: dark03
	
	overFlowMenu.states =
		crossed:
			opacity: 1
			scale: 1.1
	
	# Animation Options
	crossLine.animationOptions =
		curve: Spring(damping: 0.75)
		time: 0.5

	checkMarkContainer.animationOptions = 
		curve: Spring(damping: 0.35)
	check.animationOptions = 
		curve: Spring(damping: 0.55)
	itemLabel.animationOptions =
		instant: true
	
	# Interactions
	do(crossLine) ->
		itemLabel.onTap ->
			crossLine.stateCycle()
			
	do(checkMarkContainer) ->
		itemLabel.onTap ->
			checkMarkContainer.stateCycle()
			
	do(check) ->
		itemLabel.onTap ->
			check.stateCycle()
			
	do(itemLabel) ->
		itemLabel.onTap ->
			itemLabel.stateCycle()
			
	do(overFlowMenu) ->
		overFlowMenu.onTap ->
			overFlowMenu.stateCycle()
	
	
	
	# Layer Layering ha!
	itemLabel.sendToBack()

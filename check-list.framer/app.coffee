screenFrame = new Layer
	width: 375
	height: Screen.height
	backgroundColor: 'white'
	x:Align.center()
	x:Align.center()

itemHeight = 48
spacer = 20
checkMarkThickness = 3

# Color
fpoColor = 'rgba(0,0,0,0.0)'

dark01 = '#444444'
dark02 = '#777777'
dark03 = '#BBBBBB'

light01 = 'rgba(255,255,255,1)'
light02 = '#DDDDDD'
active01 = "#139CF1"
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
		label: "Grind coffee"
	},
	{
		label: "Rinse filter"
	}
]



for i in [0...listData.length]
	itemWrapper = new Layer
		parent: screenFrame
		width: screenFrame.width
		height: itemHeight
		y: Align.center(100 - (itemHeight*i))
		backgroundColor: fpoColor
		
	checkContainer = new Layer
		size: itemWrapper.height
		parent: itemWrapper
		backgroundColor: fpoColor
		
	check = new Layer
		parent: checkContainer
		size: checkContainer.width/2.45
		backgroundColor: null
		borderWidth: checkMarkThickness/1.5
		borderColor: dark03
		borderRadius: 4
		x: Align.center()
		y: Align.center()
		
	# Crossing out line
	crossLine = new Layer
		parent: itemWrapper
		x: check.x
		y:Align.center()
		height: checkMarkThickness/1.5
		width: check.width
		backgroundColor: active01
		opacity: 0
	
	
	# Check Mark build
	checkMarkContainer = new Layer
		parent: checkContainer
		size: checkContainer.width/4.0
		x: Align.center(-1)
		y: Align.center(-3.5)
		rotation: -45
		opacity: 0
		backgroundColor: 'rgba(0,0,0,0.0)'
		
	checkLineLong = new Layer
		parent: checkMarkContainer
		x:Align.right()
		y:Align.bottom()
		height: checkMarkThickness
		width: checkMarkContainer.width
		backgroundColor: active01
		borderRadius: 1.15
		
	checkLineShort = new Layer
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
	
	
	
	# Animation Options
	crossLine.animationOptions =
		curve: Spring(damping: 0.75)
		
	checkMarkContainer.animationOptions = 
		curve: Spring(damping: 0.35)
	check.animationOptions = 
		curve: Spring(damping: 0.55)
	itemLabel.animationOptions =
		curve: Spring(damping: 0.55)
	
	
	# Interactions
	do(crossLine) ->
		itemWrapper.onTap ->
			crossLine.stateCycle()
			
	do(checkMarkContainer) ->
		itemWrapper.onTap ->
			checkMarkContainer.stateCycle()
			
	do(check) ->
		itemWrapper.onTap ->
			check.stateCycle()
			
	do(itemLabel) ->
		itemWrapper.onTap ->
			itemLabel.stateCycle()
	
	
	
	# Layer Layering ha!
	itemLabel.sendToBack()

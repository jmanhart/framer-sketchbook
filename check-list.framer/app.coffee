bkg = new BackgroundLayer
	backgroundColor: '#AAA'
	


screenFrame = new Layer
	width: 375
	height: Screen.height
# 	backgroundColor: 'rgba(255,255,255,0.5)'
	x:Align.center()
	x:Align.center()


itemHeight = 60
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

# List Data
listData = [
	{
		label: "Drink",
	},
	{
		label: "Pour",
	},
	{
		label: "Bloom",
	},
	{
		label: "Grind Coffee",
	},
	{
		label: "Weigh Coffee",
	},
# 	{
# 		label: "Weigh Coffee",
# 	},
# 	{
# 		label: "Weigh Coffee",
# 	},
# 	{
# 		label: "Weigh Coffee",
# 	},
# 	{
# 		label: "Weigh Coffee",
# 	},
# 	{
# 		label: "Weigh Coffee",
# 	},
# 	{
# 		label: "Weigh Coffee",
# 	},
# 	{
# 		label: "Drink",
# 	},
# 	{
# 		label: "Pour",
# 	},
# 	{
# 		label: "Bloom",
# 	},
# 	{
# 		label: "Grind Coffee",
# 	},
# 	{
# 		label: "Weigh Coffee",
# 	},
# 	{
# 		label: "Weigh Coffee",
# 	},
# 	{
# 		label: "Weigh Coffee",
# 	},
# 	{
# 		label: "Weigh Coffee",
# 	},
# 	{
# 		label: "Weigh Coffee",
# 	},
# 	{
# 		label: "Weigh Coffee",
# 	},
# 	{
# 		label: "Weigh Coffee",
# 	},
]

scrollContainer = new Layer
	parent: screenFrame
	width: screenFrame.width
	x: Align.center()
	y: Align.center()
	height: 400
	clip: true
	backgroundColor: null
	

listScroll = new ScrollComponent
	parent: scrollContainer
	width: screenFrame.width
	height: screenFrame.height
	scrollHorizontal: false
	backgroundColor: null

for i in [0...listData.length]

	# Wrapper - for each list Item
	itemWrapper = new Layer
		parent: listScroll.content
		width: (screenFrame.width-spacer)
		height: itemHeight
		x: Align.center(-spacer)
		y: Align.top(((itemHeight+10)*i))
		backgroundColor: 'white'
		borderRadius: 10
		shadowY: 2
		shadowBlur:10
		shadowColor: 'rgba(0,0,0,0.1)'
		
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


	# OverFlow - Container
	overFlowContainer = new Layer
		height: itemWrapper.height
		width: (5*3)+(3*2)
		parent: itemWrapper
		x:Align.right(-spacer)
		backgroundColor: null


				


# 	for i in [0...3]
# 		overflowDot = new Layer
# 			parent: overFlowContainer
# 			size: 5
# 			borderRadius: 20
# 			x: Align.center()
# 			y: Align.top(12+(8*i))
# 			backgroundColor: dark03





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
		time: 0.5

	checkMarkContainer.animationOptions = 
		curve: Spring(damping: 0.35)
		
	check.animationOptions = 
		curve: Spring(damping: 0.55)
		
	itemLabel.animationOptions =
		instant: true
		
	
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


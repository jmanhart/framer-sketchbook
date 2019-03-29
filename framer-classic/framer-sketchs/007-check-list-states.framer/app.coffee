bkg = new BackgroundLayer
	backgroundColor: "#9971E2"
# 	backgroundColor: 'white'
	

# Load Raleway from Google Web Fonts 
roboto = Utils.loadWebFont("Roboto")


screenFrame = new Layer
	width: 375
	height: Screen.height
	backgroundColor: null
	x:Align.center()
	y:Align.bottom()


itemHeight = 60
itemWidth = 200
spacer = 20
gutter = 12
checkMarkThickness = 3

# Color
fpoColor = 'rgba(0,0,0,0.0)'

dark01 = '#444444'
dark02 = '#777777'
dark03 = '#DBDBDB'

light01 = 'rgba(255,255,255,1)'
light02 = '#DDDDDD'
active01 = "#4BDE95"

# whiteBlend = new Gradient
# 	start: "rgba(255, 255, 255, 0.2)"
# 	end: "#EDEDED"

# List Data
listData = [
	{
		label: "Alabama",
		cat: "Visited",
	},
	{
		label: "Alaska",
		cat: "Visited",
	},
	{
		label: "Arizona",
		cat: "Visited",
	},
	{
		label: "Arkansas",
		cat: "Visited",
	},
	{
		label: "California",
		cat: "Visited",
	},
	{
		label: "Colorado",
		cat: "Visited",
	},
	{
		label: "Connecticut",
		cat: "Visited",
	},
	{
		label: "Delaware",
		cat: "Visited",
	},
	{
		label: "Florida",
		cat: "Visited",
	},
	{
		label: "Georgia",
		cat: "Visited",
	},
	{
		label: "Hawaii",
		cat: "Visited",
	},
	{
		label: "Illinois",
		cat: "Visited",
	},
	{
		label: "Indiana",
		cat: "Visited",
	},
	{
		label: "Iowa",
		cat: "Visited",
	},
	{
		label: "Kansas",
		cat: "Visited",
	},
	{
		label: "Kentucky",
		cat: "Visited",
	},
	{
		label: "Louisiana",
		cat: "Visited",
	},
	{
		label: "Maine",
		cat: "Visited",
	},
	{
		label: "Maryland",
		cat: "Visited",
	},
	{
		label: "Massachusetts",
		cat: "Visited",
	},
	{
		label: "Michigan",
		cat: "Visited",
	},
	{
		label: "Minnesota",
		cat: "Visited",
	},
	{
		label: "Missouri",
		cat: "Visited",
	},
	{
		label: "Montana",
		cat: "Visited",
	},
	{
		label: "Nebraska",
		cat: "Visited",
	},
	{
		label: "Nevada",
		cat: "Visited",
	},
	{
		label: "New Hampshire",
		cat: "Visited",
	},
	{
		label: "New Jersey",
		cat: "Visited",
	},
	{
		label: "New Mexico",
		cat: "Visited",
	},
	{
		label: "New York",
		cat: "Visited",
	},
	{
		label: "North Carolina",
		cat: "Visited",
	},
	{
		label: "North Dakota",
		cat: "Visited",
	},
	{
		label: "Ohio",
		cat: "Visited",
	},
	{
		label: "Oklahoma",
		cat: "Visited",
	},
	{
		label: "Oregon",
		cat: "Visited",
	},
]









# Pennsylvania
# Rhode Island
# South Carolina
# South Dakota
# Tennessee
# Texas
# Utah
# Vermont
# Virginia
# Washington
# West Virginia
# Wisconsin
# Wyoming




scrollContainer = new Layer
	parent: screenFrame
	width: screenFrame.width
	x: Align.center()
	y: Align.top()
	height: screenFrame.height
	clip: true
	backgroundColor: null
	
listScroll = new ScrollComponent
	parent: scrollContainer
	width: screenFrame.width
	height: scrollContainer.height
	scrollHorizontal: false
	backgroundColor: null
	mouseWheelEnabled: true

listScroll.contentInset =
	top: 250
	

for i in [0...listData.length]

	# Wrapper - for each list Item
	itemWrapper = new Layer
		parent: listScroll.content
		width: (screenFrame.width-(spacer*2))
		height: itemHeight
		x: Align.left(spacer)
		y: Align.top(((itemHeight+gutter)*i))
		backgroundColor: 'white'
		borderRadius: 8
		shadow1: 
			y: 2
			blur:10
			color: 'rgba(0,0,0,0.15)'
		borderWidth: 0
		borderColor: 'rgba(0,0,0,0.15)'
		
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
		borderRadius: 40
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
		fontFamily: roboto
		color: dark01
		y:Align.center()
		x: checkContainer.width 
		
	itemCatagory = new TextLayer
		text:listData[i].cat
		parent: itemWrapper
		fontSize: 12
		textTransform: "uppercase"
		opacity: 0
		color: dark01
		y:Align.center()
		x: Align.right(-spacer)
		
	# Styling - Strike through line
	crossLine = new Layer
		parent: itemWrapper
		x: check.x
		y:Align.center()
		height: checkMarkThickness/1.5
		width: check.width
		backgroundColor: active01
		opacity: 0



	# State MGMT
	itemWrapper.states =
		start:
			scale: 1.02
		end:
			scale: 1
			
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
			
	itemCatagory.states =
		crossed:
			color: dark02
			opacity: 1
	
	
	# Animation Options
	itemWrapper.animationOptions =
		curve: Spring
	
	crossLine.animationOptions =
		curve: Spring(damping: 0.75)
		time: 0.5

	checkMarkContainer.animationOptions = 
		curve: Spring(damping: 0.35)
		
	check.animationOptions = 
		curve: Spring(damping: 0.55)
		
	itemLabel.animationOptions =
		instant: true
		
	itemCatagory.animationOptions =
		instant: true 
		
	
	# Interactions
	do(itemWrapper) ->
		itemWrapper.onMouseOver ->
			itemWrapper.stateCycle("start")
			
		# Interactions
	do(itemWrapper) ->
		itemWrapper.onMouseOut ->
			itemWrapper.stateCycle("end")
		
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
			
	do(itemCatagory) ->
		itemWrapper.onTap ->
			itemCatagory.stateCycle()
			
	
	
	
	# Layer Layering ha!
	itemLabel.sendToBack()
# 	listLabelContainer.bringToFront()
	
# listScroll.content.on "change:y", ->
# # 	Utils.modulate(value, [a, a], [b, b], limit)
# 	listLabelContainer.shadowY = Utils.modulate(listScroll.scrollY, [20, 40], [0,2], true)


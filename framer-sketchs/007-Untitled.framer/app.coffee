bkg = new BackgroundLayer
	backgroundColor: "#121212"


spacer = 30





topNav = new Layer
	width: Screen.width
	height: 64

scroll = new ScrollComponent
	y: topNav.height
	width: Screen.width
	height: Screen.height - topNav.height
	backgroundColor: null
	scrollHorizontal: false


for i in [0...10]
	# List Item Wrapper
	listItem = new Layer
		parent: scroll.content
		y: 90*i
		width: Screen.width
		height: 90
		backgroundColor: 'black'
		
	listItem.states =
		active:
			height: scroll.height
			x: 0
			y: 0
	
	# List Item Photo
	listPhoto = new Layer
		parent: listItem
		x: Align.left(spacer/2)
		y: Align.center()
		width: listItem.height - spacer
		height: listItem.height - spacer
	
	listPhoto.states = 
		active:
			x: Align.left()
			y: Align.top()
			width: scroll.width
			height: 200
			
	# List Item Main Label
	listLabel = new TextLayer
		parent: listItem
		text: "List Label"
		x: Align.left(100)
		y: Align.center()
		fontSize: 18
		
	listLabel.states =
		active:
			x: Align.center()
			y: Align.center()


	# Tap Trigger
	do(listItem) ->
		listItem.onTap ->
			listItem.stateCycle()
			listItem.bringToFront()
# 			listPhoto.stateCycle()
# 			listLabel.stateCycle()

	do(listPhoto) ->
		listItem.onTap ->
			listPhoto.stateCycle()
			
	do(listLabel) ->
		listItem.onTap ->
			listLabel.stateCycle()
			




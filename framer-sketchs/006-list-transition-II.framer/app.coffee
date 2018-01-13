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

for i in [0...5]

	listItemHeight = 90
	listPhotoHeight = 200
	
	# List Item Scroll Container
	listItemScroll = new ScrollComponent
		parent: scroll.content
		y: listItemHeight * i
		width: Screen.width
		height: listItemHeight
		backgroundColor: 'rgba(0,0,0,1)'
		scrollHorizontal: false
		scrollVertical: false
	listItemScroll.states =
		active:
			y: 0
			width: Screen.width
			height: Screen.height
			scrollVertical: true

	
	# List Item Photo
	listPhoto = new Layer
		parent: listItemScroll.content
		x: Align.left(spacer/2)
		y: Align.top(spacer/2)
		width: listItemHeight - spacer
		height: listItemHeight - spacer
		backgroundColor: 'white'
		borderRadius: 3
	listPhoto.states = 
		active:
			x: Align.left()
			y: Align.top()
			width: Screen.width
			height: listPhotoHeight
			borderRadius: 0
			
	# List Item Main Label
	diffLabel = new TextLayer
		parent: listPhoto
		text: "Difficulty"
		x: Align.left(80)
		y: Align.center(-20)
		fontSize: 12
		textAlign: "left"
	diffLabel.states =
		active:
			x: (Screen.width/2) - (diffLabel.width/2)
			y: listPhotoHeight/2
			
			
	# List Item Main Label
	listLabel = new TextLayer
		parent: listPhoto
		text: "List "
		x: Align.left(80)
		y: Align.center()
		fontSize: 18
		textAlign: "left"
	listLabel.states =
		active:
			x: (Screen.width/2) - (listLabel.width/2)
			y: listPhotoHeight/3.25
			

# 	List Item Sub content
	listItemContent = new Layer
		parent: listItemScroll.content
		y: Align.top(listItemHeight)
		height: 0
		width: Screen.width
		backgroundColor: 'rgba(0,0,255,0.5)'
	listItemContent.states =
		active:
			y: Align.top(listPhotoHeight)
			height: 1200
	

	# Tap Trigger
	do(listItemScroll) ->
		listPhoto.onTap ->
			listItemScroll.stateCycle()
			listItemScroll.bringToFront()
		topNav.onTap ->
			listItemScroll.stateCycle("default")


	do(listPhoto) ->
		listPhoto.onTap ->
			listPhoto.stateCycle()
		topNav.onTap ->
			listPhoto.stateCycle("default")
			
	do(diffLabel) ->
		listPhoto.onTap ->
			diffLabel.stateCycle()
		topNav.onTap ->
			diffLabel.stateCycle("default")
			
	do(listLabel) ->
		listPhoto.onTap ->
			listLabel.stateCycle()
		topNav.onTap ->
			listLabel.stateCycle("default")
			
	do(listItemContent) ->
		listPhoto.onTap ->
			listItemContent.stateCycle()
		topNav.onTap ->
			listItemContent.stateCycle("default")
			
		
			

# listItemContent.sendToBack()


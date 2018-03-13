bkg = new BackgroundLayer
	backgroundColor: "#E8E8E8"


spacer = 30


workoutData = [
	{
		difficulty:"Beginner",
		title: "Begi",
		bodyPart: "Total Body",
		time: "30min"
	},
]


# topNav = new Layer
# 	width: Screen.width
# 	height: 64

scroll = new ScrollComponent
	y:0
	width: Screen.width
	height: Screen.height
	backgroundColor: null
	scrollHorizontal: false
	
scroll.contentInset =
	top: 0

for i in [0...5]

	listItemHeight = 90
	listPhotoHeight = 200
	
	# List Item Scroll Container
	listItemScroll = new ScrollComponent
		parent: scroll.content
		y: listItemHeight * i
		width: Screen.width
		height: listItemHeight
		backgroundColor: null
		scrollHorizontal: false
		scrollVertical: false
	listItemScroll.states =
		active:
			y: 0
			width: Screen.width
			height: Screen.height
			scrollVertical: true

	
	# Item Photo
	listPhoto = new Layer
		parent: listItemScroll.content
		x: Align.left(spacer/2)
		y: Align.top(spacer/2)
		width: listItemHeight - spacer
		height: listItemHeight - spacer
# 		backgroundColor: 'white'
		borderRadius: 3
	listPhoto.states = 
		active:
			x: Align.left()
			y: Align.top()
			width: Screen.width
			height: listPhotoHeight
			borderRadius: 0
			backgroundColor: 'yellow'
	
	listPhoto.animationOptions =
		curve: Spring
	
	# List Labels - Main Label
	diffLabel = new Layer
		parent: listItemScroll
# 		text: workoutData[i].difficulty
# 		text:"Beginner"
		x: Align.left(95)
		y: Align.center(-10)
		height: 12
		width: Utils.randomNumber(150, 170)
		textAlign: "left"
	diffLabel.states =
		active:
			x: Align.left(80)
			y: listPhotoHeight
			opacity: 0
					
	# List Labels - Main Label
	listLabel = new Layer
		parent: listItemScroll
# 		text: workoutData[i].title
		text:"Beginner Home Workout"
		x: Align.left(95)
		y: Align.center(8)
		height: 10
		width: Utils.randomNumber(100, 110)

	listLabel.states =
		active:
			x: Align.left(80)
			y: listPhotoHeight
			opacity: 0
		
	diffLabel.animationOptions =
# 		instant: true
		
		
		

# 	List Item Sub content
	listItemContent = new Layer
		parent: listItemScroll.content
		y: Align.top(listItemHeight)
		height: 0
		width: Screen.width
		backgroundColor: 'rgba(0,0,255,1)'
	listItemContent.states =
		active:
			y: Align.top(listPhotoHeight)
			height: 1200
	
	
	heroLabel = new Layer
		parent: listItemContent
		y: Align.top(listItemHeight)
		x: Align.center()
		height: 18
		width: 100
	heroLabel.states =
		active:
			y: -150
			color: 'green'
		inactive:
			opacity: 0
			y: Align.top(listItemHeight)
			
	
	heroSubLabel = new Layer
		parent: listItemContent
		y: Align.top(listItemHeight+100)
		x: Align.center()
		height: 14
		width: 60
	heroSubLabel.states =
		active:
			y: -130
			color: 'green'
		inactive:
			opacity: 0
			y: Align.top(listItemHeight)

		

	# Tap Trigger
	do(listItemScroll) ->
		listPhoto.onTap ->
			listItemScroll.stateCycle()
			listItemScroll.bringToFront()
# 		topNav.onTap ->
# 			listItemScroll.stateCycle("default")

	do(listPhoto) ->
		listPhoto.onTap ->
			listPhoto.stateCycle()
# 		topNav.onTap ->
# 			listPhoto.stateCycle("default")
			
	do(diffLabel) ->
		listPhoto.onTap ->
			diffLabel.stateCycle()
# 		topNav.onTap ->
# 			diffLabel.stateCycle("default")
			
	do(listLabel) ->
		listPhoto.onTap ->
			listLabel.stateCycle()
# 		topNav.onTap ->
# 			listLabel.stateCycle("default")
			
	do(listItemContent) ->
		listPhoto.onTap ->
			listItemContent.stateCycle()
# 		topNav.onTap ->
# 			listItemContent.stateCycle("default")
			
	do(heroLabel) ->
		listPhoto.onTap ->
			heroLabel.stateCycle("active", "inactive")
# 		topNav.onTap ->
# 			heroLabel.stateCycle("default")
			
	do(heroSubLabel) ->
		listPhoto.onTap ->
			heroSubLabel.stateCycle("active", "inactive")
# 		topNav.onTap ->
# 			heroSubLabel.stateCycle("default")
			
		
			

# listItemContent.sendToBack()

# listPhoto.sendToBack()
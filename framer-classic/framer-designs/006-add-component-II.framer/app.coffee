
# Style Variables ----------------------------------
spacer = 20
blue = "#383838"
lightBlue = "#BBB9B9"
otherBlue = "#DBDBDB"

# Data ---------------------------------------------
actionAmount = 0
gutter = 10
indicators = []
indicatorChevOffset = 50
indicatorGutter = 10	
indicatorSize = 8
indicatorContWidth = (2 * indicatorSize) + ((2 - 1) * indicatorGutter)


indicatorData = [
	{
		name: "Ounces",
	},
	{
		name: "Cups",
	},
]



# Design Component - Positioning -------------------
indicatorCont.x = Align.center()
indicatorCont.y = Align.center()

# shape.x = Align.center()
# shape.y = Align.top(0)

minusBtn.y = Align.center()
minusBtn.x = Align.center(0)

addBtn.y = Align.center()
addBtn.x = Align.center(0)

actionBtnLabelCancel.y = Align.bottom(spacer*2)

fill.backgroundColor = otherBlue
fillTop.backgroundColor = otherBlue

# Code Components ----------------------------------

# Text 

# Create PageComponent
pageScroller = new PageComponent
	parent: indicatorCont
	x: Align.center()
	y: Align.center()
	width: indicatorCont.width
	height: indicatorCont.height / 2
	scrollVertical: false
	clip: true
	backgroundColor: null

dotIndicatorCont = new Layer
	width: indicatorContWidth
	height: 20
	x: Align.center(3)
	y: Align.bottom(-spacer/1.35)
	backgroundColor: null
	parent: indicatorCont

labels = []

for i in [0...2]
	page = new Layer
		parent: pageScroller.content
		width: pageScroller.width
		height: pageScroller.height 
		x: (pageScroller.width + gutter) * i
		backgroundColor: null

	actionLabel = new TextLayer
		parent: page
		x: Align.center(3)
		y: Align.top(-spacer)
		fontSize: 72
		text: actionAmount 
		color: blue
	
	unitLabel = new TextLayer
		parent: page
		x: Align.center(3)
		y: Align.bottom(-spacer/2)
		fontSize: 14
		text: indicatorData[i].name 
		color: blue
		
	labels.push actionLabel
	
	# creating the indicator
	indicator = new Layer
		parent: dotIndicatorCont
		size: indicatorSize
		borderRadius: indicatorCont.height
		x: (indicatorSize + indicatorGutter) * i
		y: Align.center()
		name: i
		backgroundColor: lightBlue

	# creating states for the indicator
	indicator.states = 
		active: 
			backgroundColor: blue
		inactive: 
			backgroundColor: lightBlue
	
	#pushing indicators into array
	indicators.push(indicator)
	


# Component - States -------------------------------
# shape.states =
# 	active:
# 		x: 0
minusBtn.states =
	active:
		x: Align.center(-indicatorCont.width/1.25)
		
addBtn.states =
	active:
		x: Align.center(indicatorCont.width/1.25)

actionBtn.states =
	active:
		backgroundColor: 'white'
		
actionBtnLabel.states =
	active:
		y: Align.top(-spacer*2)
		
actionBtnLabelCancel.states =
	active:
		y: Align.center()

actionLabel.states =
	goalNotMet:
		color: blue
	goalMet:
		color: "white"
		
unitLabel.states =
	goalNotMet:
		color: blue
	goalMet:
		color: "white"
		
indicatorCont.states =
	goalNotMet:
		backgroundColor: "white"
	goalMet:
		backgroundColor: blue
		
indicatorFillCont.states =
	goalNotMet:
		opacity: 1
	goalMet:
		opacity: 0
	
fillTop.states = 
	shiftForward:
		x: Align.center(10)
	shiftBack:
		x: Align.center(-10)


# Component - Animations -------------------------
addBtn.animationOptions = 
	curve: Spring(damping: .8)
	time: 0.95
		
minusBtn.animationOptions = addBtn.animationOptions
actionBtnLabel.animationOptions = addBtn.animationOptions
actionBtnLabelCancel.animationOptions = addBtn.animationOptions
indicatorFillCont.animationOptions = addBtn.animationOptions
indicatorCont.animationOptions = addBtn.animationOptions
unitLabel.animationOptions = addBtn.animationOptions
actionLabel.animationOptions = addBtn.animationOptions

# Component - Interactions -----------------------
indicatorCont.onTap ->
	minusBtn.stateCycle()
	addBtn.stateCycle()
	actionBtnLabel.stateCycle()
	actionBtnLabelCancel.stateCycle()
	actionBtn.stateCycle()


# Making the first indicator active
pageScroller.snapToPage(pageScroller.content.children[0])
current = pageScroller.horizontalPageIndex(pageScroller.currentPage)
indicators[current].states.switch("active")
	
# Changing indicator state on page change
pageScroller.on "change:currentPage", ->
	indicator.states.switch("default") for indicator in indicators
	current = pageScroller.horizontalPageIndex(pageScroller.currentPage)
	indicators[current].states.switch("active")

	# Ounces
	if current == 0 
		addBtn.onTap ->
			actionAmount += 1;	
			labels[0].text = actionAmount * 8
			labels[0].x = Align.center()
			actionLabel.x = Align.center()
			indicatorFillCont.height = actionAmount * 25
			fillTop.stateCycle()
			
		minusBtn.onTap ->
			actionAmount -= 1;
			labels[0].text = actionAmount * 8
			labels[0].x = Align.center()
			indicatorFillCont.height = actionAmount * 25
			fillTop.stateCycle()
	
	# Cups
	if current == 1
		addBtn.onTap ->
			actionAmount += 1;	
			labels[1].text = actionAmount
			labels[1].x = Align.center()
			actionLabel.x = Align.center()
			indicatorFillCont.height = actionAmount * 25
			fillTop.stateCycle()
			
		minusBtn.onTap ->
			actionAmount -= 1;
			labels[1].text = actionAmount
			labels[1].x = Align.center()
			actionLabel.x = Align.center()
			indicatorFillCont.height = actionAmount * 25
			fillTop.stateCycle()

	print current	



# addBtn.onTap ->
# 	actionAmount += 1;	
# 	labels[1].text = actionAmount
# 	labels[0].text = actionAmount * 8
# 	labels[0].x = Align.center()
# 	actionLabel.x = Align.center()
# 	indicatorFillCont.height = actionAmount * 25
# 	fillTop.stateCycle()
# 	
# 	if indicatorFillCont.height > indicatorCont.height
# 		indicatorFillCont.stateCycle("goalMet")
# 		indicatorCont.stateCycle("goalMet")
# 		actionLabel.stateCycle("goalMet")
# 		unitLabel.stateCycle("goalMet")
# 
# 	else 
# 	
# 
# minusBtn.onTap ->
# 	actionAmount -= 1;
# 	labels[1].text = actionAmount
# 	labels[0].text = actionAmount * 8
# 	actionLabel.x = Align.center()
# 	indicatorFillCont.height = actionAmount * 25
# 	fillTop.stateCycle()
# 	
# 	if indicatorFillCont.height < indicatorCont.height
# 		indicatorFillCont.stateCycle("goalNotMet")
# 		indicatorCont.stateCycle("goalNotMet")
# 		actionLabel.stateCycle("goalNotMet")
# 		unitLabel.stateCycle("goalNotMet")
# 	else 


# Component - Z-Index ----------------------------
addBtn.sendToBack()
minusBtn.sendToBack()
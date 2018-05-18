
# Style Variables ----------------------------------
spacer = 20
blue = "#1603D3"
lightBlue = "#D6DCFA"


# Data ---------------------------------------------
actionAmount = 0



# Design Component - Positioning -------------------
indicatorCont.x = Align.center()
indicatorCont.y = Align.center()

shape.x = Align.center()
shape.y = Align.top(0)


minusBtn.y = Align.center()
minusBtn.x = Align.center(0)

addBtn.y = Align.center()
addBtn.x = Align.center(0)

actionBtnLabelCancel.y = Align.bottom(spacer*2)

# Code Components ----------------------------------

# Text 
actionLabel = new TextLayer
	parent: indicatorCont
	x: Align.center()
	y: Align.center(-spacer/2)
	fontSize: 72
	text: actionAmount 
	color: blue

unitLabel = new TextLayer
	parent: indicatorCont
	x: Align.center()
	y: Align.center(spacer*2)
	fontSize: 14
	text: "cups" 
	color: blue
	
# svg = new SVGLayer
# 	svg: "<svg><path id='shape' name='Rectangle' d='M0 0 H 150 V 75 H 0 L 0 0' />"
# 	fill: "#0AF"
 
# path = svg.elements.shape
shape.strokeWidth = 4
shape.strokeColor = blue
shape.fill = lightBlue


# Component - States -------------------------------
shape.states =
	active:
		x: 0
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
		
indicatorFill.states =
	goalNotMet:
		opacity: 1
	goalMet:
		opacity: 0
	

# Component - Animations -------------------------
addBtn.animationOptions = 
	curve: Spring(damping: .8)
	time: 0.95
		
minusBtn.animationOptions = addBtn.animationOptions
actionBtnLabel.animationOptions = addBtn.animationOptions
actionBtnLabelCancel.animationOptions = addBtn.animationOptions
indicatorFill.animationOptions = addBtn.animationOptions
indicatorCont.animationOptions = addBtn.animationOptions
unitLabel.animationOptions = addBtn.animationOptions
actionLabel.animationOptions = addBtn.animationOptions

# Component - Interactions -----------------------
indicatorCont.onTap ->
	shape.stateCycle()
	minusBtn.stateCycle()
	addBtn.stateCycle()
	actionBtnLabel.stateCycle()
	actionBtnLabelCancel.stateCycle()
	actionBtn.stateCycle()

addBtn.onTap ->
	actionAmount += 1;	
	actionLabel.text = actionAmount
	actionLabel.x = Align.center()
	indicatorFill.height = actionAmount * 25
	shape.height = actionAmount * 25
	
	if indicatorFill.height > indicatorCont.height
		indicatorCont.stateCycle("goalMet")
		indicatorFill.stateCycle("goalMet")
		actionLabel.stateCycle("goalMet")
		unitLabel.stateCycle("goalMet")
		print "fuck Yeah"
	else 
		print "keep drinking"
	

	

minusBtn.onTap ->
	actionAmount -= 1;
	actionLabel.text = actionAmount
	actionLabel.x = Align.center()
	indicatorFill.height = actionAmount * 25
	
	if indicatorFill.height < indicatorCont.height
		indicatorFill.stateCycle("goalNotMet")
		indicatorCont.stateCycle("goalNotMet")
		actionLabel.stateCycle("goalNotMet")
		unitLabel.stateCycle("goalNotMet")
		print "fuck Yeah"
	else 
		print "keep drinking"







	



# Component - Z-Index ----------------------------
addBtn.sendToBack()
minusBtn.sendToBack()
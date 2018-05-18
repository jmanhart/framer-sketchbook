
# Style Variables ----------------------------------
spacer = 20
blue = "#1603D3"


# Data ---------------------------------------------
actionAmount = 0



# Design Component - Positioning -------------------
indicatorCont.x = Align.center()
indicatorCont.y = Align.center()

# indicatorFill.x = Align.center()
# indicatorFill.y = Align.center()
# indicatorFill.parent = indicatorCont


minusBtn.y = Align.center()
minusBtn.x = Align.center(0)

addBtn.y = Align.center()
addBtn.x = Align.center(0)

# actionBtn.y = Align.center()
# actionBtn.x = Align.center(0)

actionBtnLabelCancel.y = Align.bottom(spacer*2)

# Code Components ----------------------------------

# Text 
actionLabel = new TextLayer
	parent: indicatorCont
	x: Align.center()
	y: Align.center(-spacer)
	fontSize: 102
	text: actionAmount 
	color: blue

unitLabel = new TextLayer
	parent: indicatorCont
	x: Align.center()
	y: Align.center(spacer*2)
	fontSize: 24
	text: "cups" 
	color: blue

# Component - States -------------------------------
minusBtn.states =
	active:
		x: Align.center(-indicatorCont.width/1.5)
		
addBtn.states =
	active:
		x: Align.center(indicatorCont.width/1.5)

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
	minusBtn.stateCycle()
	addBtn.stateCycle()
	actionBtnLabel.stateCycle()
	actionBtnLabelCancel.stateCycle()
	actionBtn.stateCycle()


actionAmount = 0



addBtn.onTap ->
	actionAmount += 1;	
	actionLabel.text = actionAmount
	actionLabel.x = Align.center()
# 	indicatorFill.y = ((indicatorCont.height) - (actionAmount*10))
	indicatorFill.height = actionAmount * 25
	
	if indicatorFill.height > indicatorCont.height
		indicatorCont.stateCycle("goalMet")
		indicatorFill.stateCycle("goalMet")
		actionLabel.stateCycle("goalMet")
		unitLabel.stateCycle("goalMet")
		print "fuck Yeah"
	else 
# 		indicatorFill.opacity = 0
# 		indicatorCont.stateCycle()
		print "keep drinking"
	

	

minusBtn.onTap ->
	actionAmount -= 1;
	actionLabel.text = actionAmount
	actionLabel.x = Align.center()
# 	indicatorFill.y = (-(actionAmount*10))
	indicatorFill.height = actionAmount * 25
	
	if indicatorFill.height < indicatorCont.height
		
		indicatorFill.stateCycle("goalNotMet")
		indicatorCont.stateCycle("goalNotMet")
		actionLabel.stateCycle("goalNotMet")
		unitLabel.stateCycle("goalNotMet")
		print "fuck Yeah"
	else 
# 		indicatorFill.opacity = 0
# 		indicatorCont.stateCycle()
		print "keep drinking"







	



# Component - Z-Index ----------------------------
addBtn.sendToBack()
minusBtn.sendToBack()
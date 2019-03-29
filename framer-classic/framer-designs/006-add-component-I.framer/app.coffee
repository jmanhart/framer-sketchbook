
# Style Variables ----------------------------------
spacer = 20
blue = "#1603D3"


# Data ---------------------------------------------
actionAmount = 0



# Design Component - Positioning -------------------
minusBtn.y = Align.center()
minusBtn.x = Align.center(0)

addBtn.y = Align.center()
addBtn.x = Align.center(0)

actionBtn.y = Align.center()
actionBtn.x = Align.center(0)

actionBtnLabelCancel.y = Align.bottom(spacer*2)

# Code Components ----------------------------------

# Text 
actionLabel = new TextLayer
	x: Align.center(-5)
	y: Align.center(-actionBtn.height+(-spacer*2.5))
	fontSize: 102
	text: actionAmount 
	color: blue


# Component - States -------------------------------
minusBtn.states =
	active:
		x: Align.center(-actionBtn.width/1.15)
		
addBtn.states =
	active:
		x: Align.center(actionBtn.width/1.15)

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
	active:
		scale: 1.5

# Component - Animations -------------------------
addBtn.animationOptions = 
	curve: Spring(damping: .8)
	time: 0.95
		
minusBtn.animationOptions = addBtn.animationOptions
actionBtnLabel.animationOptions = addBtn.animationOptions
actionBtnLabelCancel.animationOptions = addBtn.animationOptions

# Component - Interactions -----------------------
actionBtn.onTap ->
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
	
	

minusBtn.onTap ->
	actionAmount -= 1;
	actionLabel.text = actionAmount
	actionLabel.x = Align.center()



	



# Component - Z-Index ----------------------------
addBtn.sendToBack()
minusBtn.sendToBack()
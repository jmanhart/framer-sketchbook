# Set background
Canvas.backgroundColor = "#000"

buttonTop = new Layer
	size: 60
	x: Align.center()
	y: Align.center(-50)

buttonBottom = new Layer
	size: 60
	x: Align.center()
	y: Align.center(50)


for button in [buttonTop, buttonBottom]
	button.states =
		active: 
			scale: 1.4
			rotation: 0
		inactive:
			scale: 1
			rotation: 0
			
	button.animationOptions =
		curve: Spring
	
buttonTop.onTap ->
	buttonTop.stateCycle("active")
	buttonBottom.stateCycle("inactive")
	
	
buttonBottom.onTap ->
	buttonBottom.stateCycle("active")
	buttonTop.stateCycle("inactive")
	


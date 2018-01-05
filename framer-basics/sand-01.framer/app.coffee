# Set background
Canvas.backgroundColor = "#000"


for button in [buttonRight, buttonLeft]
	button.states =
		active: 
			opactiy: 1
			scale: 1.1
			backgroundColor: "#22AA99"
		inactive:
			opacity: 0.5
			scale: 1
			
buttonRight.onTap ->
	buttonRight.stateCycle("active")
	buttonLeft.stateCycle("inactive")
	
	
buttonLeft.onTap ->
	buttonLeft.stateCycle("active")
	buttonRight.stateCycle("inactive")
bkg = new BackgroundLayer
	backgroundColor: '#121212'


spacer = 16
blue = 'blue'
white = '#ffffff'

buttonHeight = 48
buttonBorderRadius = 2
buttonLabelSize = 17

contentWidth = (Screen.width - (spacer*2))

primaryContainer = new Layer
	x: Align.center()
	y: Align.bottom(-((buttonHeight) + (spacer*2)))
	width: contentWidth
	height: buttonHeight
	borderRadius: buttonBorderRadius
	backgroundColor: blue

primaryLabel = new TextLayer
	parent: primaryContainer
	x: Align.center()
	y: Align.center()
	fontSize: buttonLabelSize
	text: "Login"
	color: white
	
	
secondaryContainer = new Layer
	x: Align.center()
	y: Align.bottom(-spacer)
	width: contentWidth
	height: buttonHeight
	borderRadius: buttonBorderRadius
	backgroundColor: '#555555'

secondaryLabel = new TextLayer
	parent: secondaryContainer
	x: Align.center()
	y: Align.center()
	fontSize: buttonLabelSize
	text: "Sign Up"
	color: white




inputs = ['Name', 'Email', 'Password', 'Re-enter Password']

formHeight = (buttonHeight + spacer) * inputs.length

#Form Container
formContainer = new Layer
	width: contentWidth
	height: formHeight
	x: Align.center()
	y: Align.bottom((buttonHeight + spacer) * inputs.length)
	backgroundColor: null

formContainer.states = 
	active:
		y: Align.top(spacer)



#Form Inputs
for i in [0...inputs.length]
	input = new Layer
		parent: formContainer
		height: buttonHeight
		width: contentWidth
		y: (buttonHeight+spacer) * i
		backgroundColor: null
		borderColor: 'white'
		borderWidth: 2
	inputPlaceholder = new TextLayer
		parent: input
		fontSize: 15
		text: inputs[i]
		y: Align.center
		x: Align.left(spacer)




primaryContainer.onTap ->
	formContainer.stateCycle()
	
secondaryContainer.onTap ->
	
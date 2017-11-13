bkg = new BackgroundLayer
	backgroundColor: '#121212'


spacer = 16

blue = 'blue'
white = '#ffffff'

buttonHeight = 48
buttonBorderRadius = 2
buttonLabelSize = 17


primaryContainer = new Layer
	x: Align.center()
	y: Align.bottom(-((buttonHeight*2) + (spacer*3)))
	width: (Screen.width - (spacer*2))
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
	y: Align.bottom(-(buttonHeight + (spacer*2)))
	width: (Screen.width - (spacer*2))
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
	
	
tertiaryContainer = new Layer
	x: Align.center()
	y: Align.bottom(-spacer)
	width: (Screen.width - (spacer*2))
	height: buttonHeight
	borderRadius: buttonBorderRadius
	backgroundColor: null

tertiaryLabel = new TextLayer
	parent: tertiaryContainer
	x: Align.center()
	y: Align.center()
	fontSize: buttonLabelSize
	text: "Tertiary Label"
	color: blue
	
bkg = new BackgroundLayer
	backgroundColor: '#AAAAAA'
	
cardCount = 5
cardWidth = 300
cardHeight = 480
cardGutter = 20
spacer = 20


cardContainer = new Layer
	x: Align.center()
	y: Align.center()
	width: cardWidth
	height: cardHeight
	backgroundColor: 'white'
	borderRadius: 8
	clip: true

cardExpand = new Layer
	parent: cardContainer
	x: Align.center()
	y: Align.bottom(-spacer)
	width: cardWidth - (spacer*2)
	height: 45

heroContainer = new Layer
	parent: cardContainer
	width: cardWidth
	
cardContainer.states =
	expanded:
		width: Screen.width
		height: Screen.height
		y: 0
		x: 0
		
heroContainer.states =
	expanded:
		width: Screen.width
		height: 300
		
cardExpand.states =
	expanded:
		opacity:0
		

cardContainer.animationOptions =
	curve: Spring(damping: 0.75)
		
cardContainer.animationOptions = heroContainer.animationOptions
		
cardExpand.onTap ->
	cardContainer.stateCycle()
	heroContainer.stateCycle()
	cardExpand.stateCycle()

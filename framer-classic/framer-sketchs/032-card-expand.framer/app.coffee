bkg = new BackgroundLayer
	backgroundColor: "#999"
	
spacer = 20
		
# Card Build
cardWrapper = new Layer
	x: Align.center()
	y: Align.top(150)
	backgroundColor: 'white'
	width: Screen.width - (spacer*2)
	height: 300
	borderRadius: 4
	
cardWrapper.states =
	open: 
		height: 450
	
cardExpandWrapper = new Layer
	parent: cardWrapper
	height: spacer*3
	width: cardWrapper.width
	x: Align.center
	y: Align.bottom
	backgroundColor: null
	shadow1: 
		y: -2
		color: '#E3E3E3'
		
cardExpandLabel = new TextLayer
	text: 'News and Stats'
	parent: cardExpandWrapper
	x: Align.center()
	y: Align.center(3)
	fontSize: 14
	fontFamily: 'work sans'
		
cardExpandButton = new Layer
	size: spacer*1.5
	parent: cardExpandWrapper
	x: Align.center()
	y: Align.top(-spacer*0.75)
	borderRadius: spacer*3
	backgroundColor: '#999'

cardExpandButtonChevronTop = new Layer
	parent: cardExpandButton
	size: spacer/2
	x: Align.center
	y: Align.center(-spacer*0.25)
	backgroundColor: null
	rotation: 45
	shadow1: 
		x:2
		y:2
		color:'white'

cardExpandButtonChevronTop.states =
	open:
		y: Align.center(-spacer*0.40)


cardExpandButtonChevronBottom = new Layer
	parent: cardExpandButton
	size: spacer/2
	x: Align.center
	y: Align.center(spacer*0)
	backgroundColor: null
	rotation: 45
	opacity: 0
	shadow1: 
		x:-2
		y:-2
		color:'white'

cardExpandButtonChevronBottom.states =
	open:
		y: Align.center(spacer*0.40)
		opacity: 1

cardExpandButtonChevronBottom.animationOptions =
	curve: Spring
	
cardExpandButtonChevronTop.animationOptions = cardExpandButtonChevronBottom.animationOptions
cardWrapper.animationOptions = cardExpandButtonChevronBottom.animationOptions

cardExpandButton.onTap ->
	cardExpandButtonChevronTop.stateCycle()
	cardExpandButtonChevronBottom.stateCycle()
	cardWrapper.stateCycle()


bkg.sendToBack()
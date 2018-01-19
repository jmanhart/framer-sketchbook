scroll = new ScrollComponent
	size: Screen.size
	scrollHorizontal: false
	backgroundColor: '#E8E8E8'
	
cardContainer = new Layer
	parent: scroll.content
	x: Align.center()
	y: Align.top(60)
	height: 350
	backgroundColor: 'white'
	width: Screen.width *0.9
	shadow1: 
		y: 2
		blur: 4
cardCopy = new Layer
	parent: cardContainer
	y: Align.bottom
	width: cardContainer.width
	height: 110	
	backgroundColor: 'white'

cardCopyTile = new Layer
	parent: cardCopy
	height: 22
	x: Align.left(70)
	y: Align.top(30)
	
cardCopySubTitle = new Layer
	parent: cardCopy
	height: 16
	x: Align.left(70)
	y: cardCopyTile.y + 35

cardImage = new Layer
	parent: cardContainer
	y: Align.top
	backgroundColor: 'red'
	width: cardContainer.width
	height: cardContainer.height - cardCopy.height

cardContainer.states =
	one:
		width: Screen.width
		height: Screen.height
		y: 0
		x: 0

# cardContainer.animationOptions =
# 	curve: Spring
# 	
cardContainer.onTap ->
	cardContainer.stateCycle()
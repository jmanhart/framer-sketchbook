bkgLayer = new BackgroundLayer
	backgroundColor: '#E8E8E8'

spacer = 25
containerWidth = Screen.width - spacer 

modA = 1.20

cardWidth = 375
cardHeight = 480

cards = []

cardContainer = new ScrollComponent
	width: Screen.width
	height: Screen.height
	scrollHorizontal: false
	
cardContainer.contentInset =
	top: 150
	bottom: 100

for i in [0...4]
	parentCard = new Layer
		parent: cardContainer.content
		x: Align.center
		y: Align.top(20+((cardHeight + spacer)*i))
		width: cardWidth
		height: cardHeight
		borderRadius: 4
		backgroundColor: 'white'
		shadowY: 1
		shadowColor: "rgba(0,0,0,0.15)"
		shadowBlur: 8
		shadowSpread: 4
	
	sideScroll = new ScrollComponent
		parent: parentCard
		height: 200
		width: cardContainer.width
		scrollVertical: false
		y: Align.bottom
		x: Align.center
	
	sideScroll.contentInset =
		left: (cardContainer.width - (cardWidth + (spacer/2))) 
		right: (cardContainer.width - (cardWidth + (spacer/2)))
		
	for i in [0...3]
		profile = new Layer
			parent: sideScroll.content
			width: containerWidth/modA
			height: sideScroll.height
			x: containerWidth/modA * i
			backgroundColor: 'rgba(0,0,0,0.0)'
		
		card = new Layer
			parent: profile
			x: Align.center()
			y: Align.center()
			width: profile.width - spacer
			height: profile.height - (spacer*2)
			borderRadius: 4
			backgroundColor: 'white'
			shadowY: 1
			shadowColor: "rgba(0,0,0,0.15)"
			shadowBlur: 8
			shadowSpread: 4
		
	divider = new Layer
		parent: parentCard
		width: 	parentCard.width
		height: 2
		y: Align.bottom(-(sideScroll.height ))
		backgroundColor: "rgba(0,0,0,0.0)"

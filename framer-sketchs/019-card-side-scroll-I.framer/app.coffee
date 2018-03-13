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


cardData = [
	{
		title: "hello 01"
		innerCards: [
			{
				innerTitle:"Inner 01",
			},
			{
				innerTitle:"Inner 02",
			},
			{
				innerTitle:"Inner 03",
			},
		]
	},
	{
		title: "hello 02"	
	},
	{
		title: "hello 03"	
	},

]

for i in [0...cardData.length]
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
	
	parentCardLabel = new TextLayer
		parent: parentCard
		x: Align.center()
		y: Align.top(40)
		fontSize: 24
		text: cardData[i].title
	
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
		
	for e in [0...cardData[e].innerCards.length]
		profile = new Layer
			parent: sideScroll.content
			width: containerWidth/modA
			height: sideScroll.height
			x: containerWidth/modA * e
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
		
		label = new TextLayer
# 			text: cardData[e].innerCards[e].innerTitle
			parent: card
			fontSize: 22
			x: Align.center()
			y: Align.center()
		
		
		
	divider = new Layer
		parent: parentCard
		width: 	parentCard.width
		height: 2
		y: Align.bottom(-(sideScroll.height ))
		backgroundColor: "rgba(0,0,0,0.0)"

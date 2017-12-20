bkg = new BackgroundLayer
	backgroundColor: 'white'

gradient = new Gradient
	start: "rgba(0,0,0,0.8)"
	end: "rgba(0,0,0,0.0)"
	
gradientTop = new Gradient
	end: "rgba(0,0,0,0.2)"
	start: "rgba(0,0,0,0.0)"

labelColor = "rgba(255,255,255, 1)"

spacer = 20

# Data Cards
cardData = [
	{
		topic: "This is a title",
		header: "Four dollar toast bottle mug",
		subHeader: "Flexitarian hell of echo park street art. Lomo chillwave raclette church-key ",
	},
	{
		topic: "This is a title",
		header: "Four dollar toast bottle mug",
		subHeader: "Flexitarian hell of echo park street art. Lomo chillwave raclette church-key ",
	},
	{
		topic: "This is a title",
		header: "Four dollar toast bottle mug",
		subHeader: "Flexitarian hell of echo park street art. Lomo chillwave raclette church-key ",
	},
]

# Scrolling Container
scroll = new ScrollComponent
	width: Screen.width
	height: Screen.height


scroll.scrollHorizontal = false

for i in [0...cardData.length]
	card = new Layer
		parent: scroll.content
		width: Screen.width*0.85
		height: Screen.width*0.95
		x: Align.center()
		y: 380 * i
		borderRadius: 10
		backgroundColor: 'gray'
		image: Utils.randomImage()
		clip: true
		
	title = new TextLayer
		parent: card
		text: cardData[i].topic
		x: Align.left(spacer)
		y: Align.top(spacer)
		width: (card.width - (spacer*2))
		fontSize: 12
		textTransform: 'uppercase'
		color: labelColor
		
	mainLabel = new TextLayer
		parent: card
		text: "Four dollar toast bottle mug"
		x: Align.left(spacer)
		y: Align.top((spacer*1.25) + title.y)
		width: (card.width - (spacer*4))
		fontSize: 28
		fontWeight: 'bold'
		lineHeight: 1.25
		color: labelColor
		
	bottomeLabel = new TextLayer
		parent: card
		text: "Flexitarian hell of echo park street art. Lomo chillwave raclette church-key "
		x: Align.left(spacer)
		y: Align.bottom(-spacer)
		fontSize: 14
		lineHeight: 1.75
		width: (card.width - (spacer*2))
		color: labelColor
	
	colorOverLay = new Layer
		parent: card
		width: card.width
		height: card.height
		backgroundColor: "#4455BB"
		opacity: 0.5
	
	topDarken = new Layer
		parent: card
		width: card.width
		y: Align.top()
		gradient: gradientTop
	
	bottomDarken = new Layer
		parent: card
		width: card.width
		y: Align.bottom()
		gradient: gradient
	
	topDarken.sendToBack()
	bottomDarken.sendToBack()
	colorOverLay.sendToBack()
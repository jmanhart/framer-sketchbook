bkgLayer = new BackgroundLayer
	backgroundColor: '#E8E8E8'

spacer = 25
containerWidth = Screen.width - spacer 

modA = 1.25


cards = []

for i in [0...4]
	parentCard = new Layer
		x: Align.center
		y: Align.top(20+(420*i))
		width: containerWidth
		height: 400
		borderRadius: 8
		backgroundColor: 'white'
		shadowY: 1
		shadowColor: "rgba(0,0,0,0.15)"
		shadowBlur: 8
		shadowSpread: 4
	
	sideScroll = new ScrollComponent
		parent: parentCard
		height: 150
		width: 414
		scrollVertical: false
		y: Align.bottom
		x: Align.center
	
	sideScroll.contentInset =
		right: spacer/2
		left: spacer/2
		
	for i in [0..5]
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
			height: profile.height - spacer
			borderRadius: 10
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
		backgroundColor: "rgba(0,0,0,0.1)"

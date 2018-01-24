bkgLayer = new BackgroundLayer
	backgroundColor: '#E8E8E8'

containerWidth = Screen.width/1.40
spacer = 25

cards = []


parentCard = new Layer
	x: Align.center
	y: Align.center
	width: Screen.width - spacer
	height: Screen.height - 300
	borderRadius: 8
	backgroundColor: 'white'
	shadowY: 1
	shadowColor: "rgba(0,0,0,0.15)"
	shadowBlur: 8
	shadowSpread: 4

sideScroll = new ScrollComponent
	parent: parentCard
	height: 200
	width: 414
	scrollVertical: false
	y: Align.bottom
	x: Align.center

sideScroll.contentInset =
	right: spacer
	
for i in [0..5]
	profile = new Layer
		parent: sideScroll.content
		width: containerWidth
		height: sideScroll.height
		x: containerWidth * i
		backgroundColor: null
	
	card = new Layer
		parent: profile
		x: Align.right()
		y: Align.center()
		width: profile.width - spacer
		height: profile.height - spacer
		borderRadius: 8
		backgroundColor: 'white'
		shadowY: 1
		shadowColor: "rgba(0,0,0,0.15)"
		shadowBlur: 8
		shadowSpread: 4
	
divider = new Layer
	parent: parentCard
	width: 	parentCard.width
	height: 1
	y: Align.bottom(-(sideScroll.height + spacer))

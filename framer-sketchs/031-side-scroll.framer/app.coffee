bkgLayer = new BackgroundLayer
	backgroundColor: '#E8E8E8'

containerWidth = Screen.width/1.20
spacer = 25

cards = []


parentCard = new Layer
	x: Align.center
	y: Align.center
	width: Screen.width - spacer
	height: Screen.height - 300
	borderRadius: 8
	backgroundColor: 'white'
	shadowY: 2
	shadowBlur: 5
	shadowSpread: 2

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
		shadowY: 2
		shadowBlur: 5
		shadowSpread: 2
		

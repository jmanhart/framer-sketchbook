bkgLayer = new BackgroundLayer	
	backgroundColor: '#E1E1E1'

spacer = 10
itemHeight = 150

screenWrapper = new ScrollComponent
	x: Align.center()
	y: Align.center()
	height: Screen.height
	width: Screen.width

for i in [0...5]
	itemWrapper = new Layer
		parent: screenWrapper.content
		width: Screen.width
		height: itemHeight
		backgroundColor: 'white'
		y: (itemHeight+spacer) * i
	
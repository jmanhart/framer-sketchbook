bkg = new BackgroundLayer
	backgroundColor: '#AAAAAA'

# Variables
pageCount = 8
gutter = 20

# Create PageComponent
pageScroller = new PageComponent
	point: Align.center
	width: Screen.width / 1.35
	height: Screen.height / 2
	scrollVertical: false
	clip: false


pageScroller.states = 
	expanded:
		width: Screen.width
		height: Screen.height
		x: 0
		y: 0

# Loop to create pages
for i in [0...pageCount]
	page = new Layer
		size: pageScroller.size
		x: (pageScroller.width + gutter) * i
		backgroundColor: 'white'
		borderRadius: 8
		parent: pageScroller.content

	page.states = 
		expanded:
			width: Screen.width
			height: Screen.height
# 			x: 0
# 			y: 0
	
	do(page) ->
		page.onClick ->
			pageScroller.stateCycle()
			page.stateCycle()


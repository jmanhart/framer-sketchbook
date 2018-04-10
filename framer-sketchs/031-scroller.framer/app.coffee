bkg = new BackgroundLayer
	backgroundColor: '#E1E1E1'
# 	backgroundColor: "#00AAFF"
# 	hueRotate: index * 20
	
# Variables
pageCount = 8
gutter = 30

# Create PageComponent
pageScroller = new PageComponent
	point: Align.center
	width: Screen.width / 1.5
	height: Screen.height / 2
	scrollVertical: false
	clip: false


profile = new Layer
	width: Screen.width
	height: 300

# Loop to create pages
for index in [0...pageCount]
	page = new Layer
		size: pageScroller.size
		x: (pageScroller.width + gutter) * index
		backgroundColor: "white"
		borderRadius: 8
# 		hueRotate: index * 20
		parent: pageScroller.content
		shadow1: 
			y: 2
			color:'rgba(0,0,0,0.15)'
			blur: 10


		
	pageScroller.on "change:currentPage", ->
# 		print pageScroller.currentPage
# 		bkg.backgroundColor = 'pink'

# 	page.on Events.Scroll, ->
# 		print page.closestPage
		
	page.onClick ->
		pageScroller.snapToPage(this)
# 		print pageScroller.nextPage()


profile.sendToBack()
bkg.sendToBack()

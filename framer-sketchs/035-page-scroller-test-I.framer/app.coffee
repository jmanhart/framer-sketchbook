# Variables
pageCount = 6
gutter = 10

# Create PageComponent
pageScroller = new PageComponent
	y: Align.center()
	x: Align.center()
	width: 200
	height: Screen.height
	scrollVertical: false
	clip: false


rectA = new Layer
	size: 100
	x: Align.center
	y: Align.center(-200)

pages = []

# Loop to create pages
for index in [0...pageCount]
	page = new Layer
		height: 200
		width: 200
		x: (200 + gutter) * index
# 		x: Align.left(index * 220)
		y: Align.center()
		backgroundColor: "white"
# 		hueRotate: index * 20
		opacity: 0.25
		parent: pageScroller.content
		name: "page " + (index + 1)
		
	rect = new Layer
		parent: page
		height: 50
		width: 50
		y: Align.center
		x: Align.center
	
# 	rect.states =
# 		active:
# 			scale: 2
		
	page.states =
		active:
			opacity: 1
			height: 200
		
		
		
	pages.push page

		

current = pageScroller.horizontalPageIndex(pageScroller.currentPage)	
pages[current].states.switch("active")

		
# Print Current Page
pageScroller.on "change:currentPage", ->

	page.states.switch("default") for page in pages
	current = pageScroller.horizontalPageIndex(pageScroller.currentPage)
	pages[current].states.switch("active")
	
# 	rect.states.switch("default") for rect in pages
# 	current = pageScroller.horizontalPageIndex(pageScroller.currentPage)
# 	pages[current].states.switch("active")
	
# 	print current

pageScroller.onMove ->
# 	rectA.x = Utils.modulate(pageScroller.scrollX, [0, 100], [10, 320], true)
	
	if pageScroller.scrollX > (100)
		rectA.x = Utils.modulate(pageScroller.scrollX, [0, 100], [Align.center(), 120], true)
		
	if pageScroller.scrollX < (100)
		rectA.x = Utils.modulate(pageScroller.scrollX, [0, 120], [10, 100], true)



# Print Current Page
pageScroller.on "change:currentPage", ->
# 	print pageScroller.currentPage

# Print Previous Page
pageScroller.on "change:currentPage", ->
# 	print pageScroller.previousPage

# Print Next Page
pageScroller.on "change:currentPage", ->
# 	print pageScroller.nextPage()
		





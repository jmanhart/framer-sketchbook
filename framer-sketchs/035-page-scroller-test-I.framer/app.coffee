# Variables
pageCount = 6
gutter = 10

# Create PageComponent
pageScroller = new PageComponent
	point: Align.center
	width: Screen.width
	height: Screen.height
	scrollVertical: false
	clip: false


pages = []

# Loop to create pages
for index in [0...pageCount]
	page = new Layer
		height: 200
		width: 200
# 		x: (200 + gutter) * index
		x: Align.center(index * 200)
		y: Align.center()
		backgroundColor: "#00AAFF"
# 		hueRotate: index * 20
		opacity: 0.5
		parent: pageScroller.content
		name: "page " + (index + 1)
			
			
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
	
	
# 	print current






# Print Current Page
pageScroller.on "change:currentPage", ->
# 	print pageScroller.currentPage

# Print Previous Page
pageScroller.on "change:currentPage", ->
# 	print pageScroller.previousPage

# Print Next Page
pageScroller.on "change:currentPage", ->
# 	print pageScroller.nextPage()
		


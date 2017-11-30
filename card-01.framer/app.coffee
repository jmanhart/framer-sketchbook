bkg = new BackgroundLayer
	backgroundColor: "#D8E1E3"

spacer = 5

fpoColor = 'rgba(0,0,0,0.2)'

cardDetailsContainerHeight = 50
cardImageContainerHeight = 200
cardInfoContainerHeight = 100
cardContainerHeight = cardDetailsContainerHeight + cardImageContainerHeight + cardInfoContainerHeight



cardContainer = new Layer
	width: Screen.width - (spacer*4)
	height: cardContainerHeight
	x: Align.center()
	y: Align.center()
	backgroundColor: 'white'
	borderRadius: spacer*2
	clip: true
	
# Component - Card Details
cardDetailsContainer = new Layer
	parent: cardContainer
	width: cardContainer.width
	height: cardDetailsContainerHeight
	backgroundColor: fpoColor

# Component - Card Image	
cardImageContainer = new Layer
	parent: cardContainer
	y: cardDetailsContainerHeight
	width: cardDetailsContainer.width
	height: cardImageContainerHeight
	backgroundColor: fpoColor
	
cardImage = new Layer
	parent: cardImageContainer
	x: Align.center()
	y: Align.center()
	width: cardImageContainer.width - (spacer*4)
	height: cardImageContainer.height - (spacer*4)

# Component - Card Info
cardInfoContainer = new Layer
	parent: cardContainer
	y: cardDetailsContainerHeight + cardImageContainerHeight
	width: cardDetailsContainer.width
	height: cardInfoContainerHeight
	backgroundColor: fpoColor






# # Variables
# pageCount = 8
# gutter = 60
# 
# # Create PageComponent
# pageScroller = new PageComponent
# 	point: Align.center
# 	width: Screen.width / 2
# 	height: Screen.height / 2
# 	scrollVertical: false
# 	clip: false
# 
# # Loop to create pages
# for index in [0...pageCount]
# 	page = new Layer
# 		size: pageScroller.size
# 		x: (pageScroller.width + gutter) * index
# 		backgroundColor: "#00AAFF"
# 		hueRotate: index * 20
# 		parent: pageScroller.content
# 
# 	page.onClick ->
# 		pageScroller.snapToPage(this)


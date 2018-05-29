# Prototype Information
Framer.Info =
	title: "Prototype"
	author: "John Manhart"
	description: "Test Build!"
	
# Disabling Hints for previewing
Framer.Extras.Hints.disable()

# Setting up preloader Image
Framer.Extras.Preloader.enable()
Framer.Extras.Preloader.setLogo("https://twitter.com/framerjs/profile_image?size=bigger")

# Editing the device background color
Framer.Device.background.backgroundColor = "#1D212A"

# Changing the indicator to a cursor from white circle
document.body.style.cursor = "auto"

spacer = 16

bkg = new BackgroundLayer
	backgroundColor: '#1a1a1a'

class pageContainer extends Layer
	constructor: (options) ->
		super _.defaults options,
			width: Screen.width 
			height: Screen.height 
			backgroundColor: 'rgba(255,255,255,0.2)'



pageData = [
	{
		bkgColor: 'pink',
	},
	{
		bkgColor: 'yellow',
	},
	{
		bkgColor: 'green',
	},
]


# one = new pageContainer
pageCount = 3
gutter = 0
# Indicator Variables
indicators = []
indicatorChevOffset = 50
indicatorGutter = 10	
indicatorSize = 4
indicatorContWidth = (pageCount * indicatorSize) + ((pageCount - 1) * indicatorGutter)


# Create PageComponent
pageScroller = new PageComponent
	point: Align.center
	width: Screen.width
	height: Screen.height
	scrollVertical: false
	clip: false

# creating container for the indicators
indicatorCont = new Layer
	width: indicatorContWidth
	height: 20
	x: Align.center()
	y: Align.bottom(-4)
	backgroundColor: null
	parent: pageScroller
# Loop to create pages
for index in [0...pageCount]
	page = new pageContainer
		size: pageScroller.size
		x: (Screen.width * index)
		y: Align.center()
		parent: pageScroller.content
		backgroundColor: "#00AAFF"
		hueRotate: index * 10


	pageTitle = new TextLayer
		parent: page
		fontSize: 17
		y: Align.center()
		x: Align.center()
		color: 'rgba(255,255,255,1)'	
	pageSubTitle = new TextLayer
		parent: page
		fontSize: 17
		y: Align.center(30)
		x: Align.center()
		color: 'rgba(255,255,255,0.5)'		
		
		
	# creating the indicator
	indicator = new Layer
		parent: indicatorCont
		size: indicatorSize
# 		borderRadius: indicatorCont.height
		x: (indicatorSize + indicatorGutter) * index
		y: Align.center()
		name: index
		backgroundColor: 'rgba(255,255,255 0.15)'

	# creating states for the indicator
	indicator.states = 
		active: 
			backgroundColor: 'rgba(255,255,255 1)'
		inactive: 
			backgroundColor: 'rgba(255,255,255 0.15)'
	
	#pushing indicators into array
	indicators.push(indicator)
	
# Making the first indicator active
pageScroller.snapToPage(pageScroller.content.children[0])
current = pageScroller.horizontalPageIndex(pageScroller.currentPage)
indicators[current].states.switch("active")
	
# Changing indicator state on page change
pageScroller.on "change:currentPage", ->
	indicator.states.switch("default") for indicator in indicators
	current = pageScroller.horizontalPageIndex(pageScroller.currentPage)
	indicators[current].states.switch("active")





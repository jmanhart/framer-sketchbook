# Prototype – Variables


tabCount = 4

tabBarHeight = 50
navTopHeight = 60
navTopBkgColor = "#121212"

textXLarge = 22
textLarge = 20
textMedium = 18
textRegular = 16 
textSmall = 12
textXSmall = 10

spacer = 20

bkgColor = "#E3E3E3"

shadowColor01 = "rgba(0,0,0,0.1)"

# Prototype – Data
tabData = [
	{
		label: "Tab One"
	},
	{
		label: "Tab Two"
	},
	{
		label: "Tab Three"
	},
	{
		label: "Tab Four"
	},
]

#Prototype – Classes

class pageContainer extends Layer
	constructor: (options) ->
		super _.defaults options,
			x: Align.center()
			y: Align.center()
			width: Screen.width - (spacer*2)
			height: 400
			backgroundColor: 'white'
			shadowY: 3
			shadowBlur: 10
			shadowColor:'rgba(0,0,0,0.2)'
			style:
				"font-size":"0.75em"
				"display":"flex"
				"align-items":"center"
				"justify-content":"center"
				"color":"black"

#Prototype – Flow Transition
# scaleTransition = (nav, pageOne, pageTwo, pageThree, pageFour) ->
# 	transition =
# 		pageOne:
# 			show:
# 				scale: 1.0
# 				opacity: 1
# 			hide:
# 				scale: 0.5
# 				opacity: 0
# 		pageTwo:
# 			show:
# 				scale: 1.0
# 				opacity: 1
# 			hide:
# 				scale: 0.5
# 				opacity: 0
# 		pageThree:
# 			show:
# 				scale: 1.0
# 				opacity: 1
# 			hide:
# 				scale: 0.5
# 				opacity: 0
# 		pageFour:
# 			show:
# 				scale: 1.0
# 				opacity: 1
# 			hide:
# 				scale: 0.5
# 				opacity: 0

#### Prototype – Page One
pageOne = new Layer
	size: Screen.size
	backgroundColor: bkgColor
	
pageOneScroll = new ScrollComponent
	parent: pageOne
	size: pageOne.size
	scrollHorizontal: false
	
pageOneHero = new Layer
	parent: pageOneScroll.content
	height: 350
	y: Align.top(navTopHeight)
	width: Screen.width
	backgroundColor: 'pink'
	shadowY: 2
	shadowBlur: 4
	shadowColor: shadowColor01
	
pageOneHeroCopy = new Layer
	parent: pageOneHero
	y: Align.bottom()
	width: Screen.width
	height: 150
	backgroundColor: 'white'



	





# Prototype – Page Two
pageTwo = new Layer
	size: Screen.size
	backgroundColor: bkgColor
	
pageTwoContent = new pageContainer
	parent: pageTwo
	html:"Page Two"

# Prototype – Page Three
pageThree = new Layer
	size: Screen.size
	backgroundColor: bkgColor
	
pageThreeContent = new pageContainer
	parent: pageThree
	html:"Page Three"

# Prototype – Page Four
pageFour = new Layer
	size: Screen.size
	backgroundColor: bkgColor
	
pageFourContent = new pageContainer
	parent: pageFour
	html:"Page Four"

# Prototype – Flow Initialize
# Flow Component
flow = new FlowComponent

flow.header = topBarContainer
flow.footer = bottomTabBarContainer

# Intial Page
flow.showNext(pageOne)

# Prototype – Bottom Tab Bar (Navigation)
bottomTabBarContainer = new Layer
	width: Screen.width
	height: tabBarHeight
	y: Align.bottom()
	backgroundColor: 'white'

# Empty Tab Array for Routing
tabs = []

for i in [0...tabCount]
	tab = new Layer
		parent: bottomTabBarContainer
		width: bottomTabBarContainer.width / tabCount
		height: bottomTabBarContainer.height
		x: (bottomTabBarContainer.width / tabCount) * i
		backgroundColor: null

	tabText = new TextLayer
		parent: tab
		fontSize: textSmall
		x: Align.center()
		y: Align.center()
		text: tabData[i].label
		color: '#888888'
	
	tabs.push tab

# Prototype – Top Bar (Naviagtion)

topBarContainer = new Layer
	width: Screen.width
	height: navTopHeight
	y: Align.top()
	backgroundColor: navTopBkgColor
	
pageTitle = new TextLayer
	parent: topBarContainer
	x: Align.center()
	y: Align.center()
	

# Prototype – Routing 



# Tap Events for the Bottom Navigation Bar
tabs[0].onClick ->
	flow.showNext(pageOne, animate: false)
	
tabs[1].onClick ->
	flow.showNext(pageTwo, animate: false)
	
tabs[2].onClick ->
	flow.showNext(pageThree, animate: false)
	
tabs[3].onClick ->
	flow.showNext(pageFour, animate: false)

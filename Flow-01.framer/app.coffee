{Symbol} = require "symbols/Symbol"
# {rubber, } = require "myModule"
# 
# 
# 
# print myFunction

{test} = require "rubberDuck"

test()


# Pages 
pageOne = new Layer
	size: Screen.size
	backgroundColor: "#00AAFF"
 
pageTwo = new Layer
	size: Screen.size
	backgroundColor: "#FFCC33"
 
pageThree = new Layer
	size: Screen.size
	backgroundColor: "green"

pageFour = new Layer
	size: Screen.size
	backgroundColor: "pink"

# Flow Component
flow = new FlowComponent

# Intial Page
flow.showNext(pageOne)
 

tabCount = 4

# tabData = [
# 	{
# 		label: "Connections"
# 	}
# 	{
# 		label: "News Feed"
# 	}
# 	{
# 		label: "Messages"
# 	}
# 
# ]



tabBarContainer = new Layer
	width: Screen.width
	height: 80
	y: Align.bottom()
	backgroundColor: 'white'

tabs = []

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

for i in [0...tabCount]
	tab = new Layer
		parent: tabBarContainer
		width: tabBarContainer.width / tabCount
		height: tabBarContainer.height
		x: (tabBarContainer.width / tabCount) * i
		backgroundColor: null
		
	for dude, i in tabData
		tabText = new TextLayer
			parent: tab
			fontSize: 16
			color: "white"
			x: Align.center()
			y: Align.center()
			text: "dude"
			color: '#888888'
	
	tabs.push tab
	

# Routing 
tabs[0].onClick ->
	flow.showNext(pageOne, animate: false)
	
tabs[1].onClick ->
	flow.showNext(pageTwo, animate: false)
	
tabs[2].onClick ->
	flow.showNext(pageThree, animate: false)
	
tabs[3].onClick ->
	flow.showNext(pageFour, animate: false)
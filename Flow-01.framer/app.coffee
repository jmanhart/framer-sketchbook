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

for i in [0...tabs]
	tab = new Layer
		parent: tabBarContainer
		width: tabBarContainer.width / tabCount
		height: tabBarContainer.height
		x: (tabBarContainer.width / tabCount) * i
		backgroundColor: null
	
	tabText = new TextLayer
		parent: tab
		fontSize: 16
		color: "white"
		x: Align.center()
		y: Align.center()
		text: "Tab #{i + 1}"
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
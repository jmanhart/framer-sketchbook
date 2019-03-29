scroller = new ScrollComponent
	width: Screen.width
	height: Screen.height
	scrollHorizontal: false

fillerItemLocation = 2

fillerItemCount = 10
fillerItemHeight = 120
fillerItemGutter = 10
fillerItems = []

for i in [0...fillerItemCount]	
	fillerItem = new Layer
		parent: scroller.content
		x: Align.center()
		y: Align.top((fillerItemHeight + fillerItemGutter ) * i)
		width: Screen.width - 40
		height: fillerItemHeight

	fillerItems.push(fillerItem)

	
	
	for fillerItem in fillerItems[(fillerItemLocation+1)..fillerItemCount]
# 		willy = fillerItems[fillerItemLocation].y + 60 + fillerItemGutter
		fillerItem.backgroundColor = 'yellow'
	for i in fillerItems[(fillerItemLocation+1)..fillerItemCount]
		this.y = 100

# belowActive = new Layer
# 	y: fillerItems[fillerItemLocation].y + 60 + fillerItemGutter
# 	x: Align.center()
# 	width: Screen.width
# 	height: 1000
# 	
# for r in fillerItems[4..7]	
# 	dude = new Layer
# 		parent: belowActive
# 		x: Align.center()
# 		height: fillerItemHeight
# 		y: Align.top((fillerItemHeight + fillerItemGutter ) * r)
# 		width: Screen.width - 40
# 		backgroundColor: 'pink'
# 	



fillerItems[fillerItemLocation].height = 60


# button = new Layer
# 	x: Align.center()
# 	y: fillerItems[fillerItemCount-1].y + (fillerItemHeight + fillerItemGutter )
# 	parent: scroller.content
# 	height: 60
# 	width: Screen.width - 40

# print fillerItems[4].y


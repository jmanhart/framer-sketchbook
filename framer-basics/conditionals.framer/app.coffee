
# Variables
## Item 
itemHeight = 50
itemWidth = 200
itemGutter = 20

## Type
labelLarge = 22
labelMedium = 18
labelSmall = 14

## Colors
dark01 = "#333333"
dark02 = "#555555"
light01 = "#555555"
light02 = "#BBBBBB"


# layerA = new Layer
# 	size: 50
# layerA.draggable.enabled = true
#  
# marker = new Layer
# 	x: Align.center
# 	y: Align.center
#  
# layerA.onDrag ->
#     if layerA.x > marker.x and layerA.y > marker.y
#         layerA.backgroundColor = "red"
#     else
#         layerA.backgroundColor = "green"


scrollFrame = new Layer
	x: Align.center()
	y: Align.center()
	height: 400
	width: 200
	
scroll = new ScrollComponent
	parent: scrollFrame
	size: scrollFrame.size
	scrollHorizontal: false

items = []

for i in [0...15]
	itemWrapper = new Layer
		parent: scroll.content
		name: "Item #{i + 1}"
		width: itemWidth 
		height: itemHeight
		y: Align.top(10 + ((itemHeight + itemGutter) * i))
		
	items.push itemWrapper
	

# Utils.modulate(value, [a, a], [b, b], limit)
scroll.content.on "change:y", ->
	if items[2].y = 400
		items[2].backgroundColor = 'blue'

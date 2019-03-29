# square = new Layer
# 	size: 20
# 	y: Align.top(20)
# 	x: Align.left(20)

gray = "rgb(235, 237, 240)"

green01 = "rgb(198, 228, 139)"
green02 = "rgb(123, 201, 111)"
green03 = "rgb(35, 154, 59)"
green04 = "rgb(25, 97, 39)"

# Random Color Arry - This is Rough :(
randomColor = [
# 	gray, 
# 	gray, 
# 	gray, 
# 	gray, 
# 	gray, 
# 	gray, 
	green01, 
	green01, 
	green01, 
	green01,
	green01, 
	green01,  
	green02, 
	green02,
	green02,
	green03,
	green03,
	green03, 
	green04
]
	
	
# Variables
tileCount = 364
columnCount = 52
gutter = 2

combinedGutterWidth = gutter * (columnCount - 1)
# combinedTileWidth = Screen.width - combinedGutterWidth
combinedTileWidth = 52 * 9
tileWidth = combinedTileWidth / columnCount
tileOffset = tileWidth + gutter


randomBackgroundColor = () ->
	Utils.randomChoice(randomColor)

scroll = new ScrollComponent
	size: Screen.size
	scrollHorizontal: false

tiles = []

updateBackgroundColor = () ->
	Utils.randomChoice(randomColor)


# Loop to create grid tiles
for index in [0...tileCount]

	columnIndex = index % columnCount
	rowIndex = Math.floor(index / columnCount)

	tile = new Layer
		x: Align.left(50 + (columnIndex * tileOffset))
		y: Align.top(50 + (rowIndex * tileOffset))
		size: tileWidth
		borderRadius: 0
		parent: scroll.content
		backgroundColor: updateBackgroundColor()
		
	tiles.push(tile)
	
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
# 	tile.states =
# 		active:
# 			backgroundColor: randomBackgroundColor()
# 		inActive:
# 			backgroundColor: randomBackgroundColor()
# 			
# 	tile.animationOptions =
# 		curve: Spring
		
# 	do(tile) ->	
# 		Utils.delay 1, ->
# 			tile.stateCycle("active", "inActive")
			
	



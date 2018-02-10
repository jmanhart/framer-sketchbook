spacer = 20

toggle = new Layer
	width: 100
	height: 100
	y: Align.top(spacer)
	x: Align.center()




graphContainer = new Layer
	width: Screen.width - (spacer*4)
	height: 200
	x: Align.center()
	y: Align.bottom(-spacer*2)
	clip: true
	backgroundColor: null
	
	
	
sleepLevelsDate = [
	deepEvents: 10
	lightEvents: 5
	remEvents: 10
	awakeEvents:10


]
	
	

# 	
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
# remLevels = new Layer
# 	parent: graphContainer
# 	width: graphContainer.width
# 	height: graphContainer.height*0.75
# 	y: Align.bottom
# 	backgroundColor: '#793EAC'
# 	

lightEvent = 8
remEvent = 10
awakeEvents = 3

toggledGraphHeight = 0.9
toggledGraphY = 0.1

deepLevels = new Layer
	parent: graphContainer
	width: graphContainer.width
	height: graphContainer.height*0.25
	y: Align.bottom
	backgroundColor: '#237EAC'
	
deepLevels.states =
	toggled:
		height: graphContainer.height*0.15
		y: graphContainer.height*toggledGraphHeight

do(deepLevels) ->
	toggle.onTap ->

		deepLevels.stateCycle()


for i in [0...lightEvent]
	lightLevels = new Layer
		parent: graphContainer
		width: Utils.randomNumber(20, 40)
		height: graphContainer.height*0.50
		y: Align.bottom
		x: Utils.randomNumber(0, graphContainer.width)
		backgroundColor: '#11A9ED'
		
	lightLevels.states =
		toggled:
			height: graphContainer.height*toggledGraphY
			y: graphContainer.height*toggledGraphHeight
	
	do(lightLevels) ->
		toggle.onTap ->

			lightLevels.stateCycle()


for i in [0...awakeEvents]
	remLevels = new Layer
		parent: graphContainer
		width: Utils.randomNumber(0, 30)
		height: graphContainer.height*0.75
		y: Align.bottom
		x: Utils.randomNumber(0, graphContainer.width)
		backgroundColor: '#793EAC'
		
	remLevels.states =
		toggled:
			height: graphContainer.height*toggledGraphY
			y: graphContainer.height*toggledGraphHeight
	
	do(remLevels) ->
		toggle.onTap ->

			remLevels.stateCycle()
	

for i in [0...awakeEvents]
	awakeLevels = new Layer
		parent: graphContainer
		width: Utils.randomNumber(0, 3)
		height: graphContainer.height
		y: Align.bottom
# 		x: Utils.randomNumber(0, graphContainer.width)
# 		x: Utils.randomNumber((50>0), (100>50))
		x: Utils.randomNumber(10,100)
		backgroundColor: '#DF6ECD'
		
	awakeLevels.states =
		toggled:
			height: graphContainer.height*toggledGraphY
			y: graphContainer.height*toggledGraphHeight
	
	do(awakeLevels) ->
		toggle.onTap ->
		# 	deepLevels.stateCycle()
		# 	lightLevels.stateCycle()
		# 	remLevels.stateCycle()
			awakeLevels.stateCycle()
	

# 
# remLevels.bringToFront()
# lightLevels.bringToFront()
# deepLevels.bringToFront()
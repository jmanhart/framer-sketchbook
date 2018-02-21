spacer = 20

graphContainer = new Layer
	width: Screen.width - 100
	height: 200
	x: Align.center()
	y: Align.bottom(-spacer*2)
	clip: true
	backgroundColor: 'rgba(255,255,255,0.05)'
	

toggledGraphHeight = 0.9
toggledGraphY = 0.1

sleepEvents = [
	light:
		numberOf: 10
		height: 0.50
		minWidth:10
		maxWidth: 50
		backgroundColor: '#11A9ED'
		
	rem:
		numberOf: 3
		height: 0.75
		minWidth:8
		maxWidth: 12
		backgroundColor: '#793EAC'
		
	awake:
		numberOf: 5
		height: 1
		minWidth: 0.5
		maxWidth: 3
		backgroundColor: '#DF6ECD'
]


toggle = new Layer
	width: 108
	height: 15
	x: 217
	y: 403
	backgroundColor: null

toggleIcon = new Layer
	size: 11
	backgroundColor: 'white'
	parent: toggle
	y: Align.center()
	x: Align.left(5)
	
	
toggleLabel = new TextLayer
	text: "Show Movement"
	parent: toggle
	fontSize: 11
	y: Align.center()
	x: Align.left(20)



# Deep Build
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


#Light Build
for i in [0...sleepEvents[0].light.numberOf]
	lightLevels = new Layer
		parent: graphContainer
		width: Utils.randomNumber(sleepEvents[0].light.minWidth, sleepEvents[0].light.maxWidth)
		height: graphContainer.height*(sleepEvents[0].light.height)
		y: Align.bottom
		x: Utils.randomNumber(0, graphContainer.width)
		backgroundColor: sleepEvents[0].light.backgroundColor
	lightLevels.states =
		toggled:
			height: graphContainer.height*toggledGraphY
			y: graphContainer.height*toggledGraphHeight
	
	do(lightLevels) ->
		toggle.onTap ->
			lightLevels.stateCycle()
			
#REM Build
for i in [0...sleepEvents[0].rem.numberOf]
	remLevels = new Layer
		parent: graphContainer
		width: Utils.randomNumber(sleepEvents[0].rem.minWidth, sleepEvents[0].rem.maxWidth)
		height: graphContainer.height*(sleepEvents[0].rem.height)
		y: Align.bottom
		x: Utils.randomNumber(0, (graphContainer.width-50))
		backgroundColor: sleepEvents[0].rem.backgroundColor
	remLevels.states =
		toggled:
			height: graphContainer.height*toggledGraphY
			y: graphContainer.height*toggledGraphHeight
	
	do(remLevels) ->
		toggle.onTap ->
			remLevels.stateCycle()

# Awake Build	
for i in [0...sleepEvents[0].awake.numberOf]
	awakeLevels = new Layer
		parent: graphContainer
		width: Utils.randomNumber(sleepEvents[0].awake.minWidth, sleepEvents[0].awake.maxWidth)
		height: graphContainer.height*(sleepEvents[0].awake.height)
		y: Align.bottom
		x: Utils.randomNumber(0, (graphContainer.width-50))
		backgroundColor: sleepEvents[0].awake.backgroundColor
	awakeLevels.states =
		toggled:
			height: graphContainer.height*toggledGraphY
			y: graphContainer.height*toggledGraphHeight
	
	do(awakeLevels) ->
		toggle.onTap ->
			awakeLevels.stateCycle()





# polyOff.backgroundColor = 'yellow'
# polyOff.parent = graphContainer
# polyOff.y = Align.bottom(-spacer*2)
# polyOff.x = Align.center()
# 
# 
# 
# toggle.onTap ->
	











# dude = 200
# 
# 
# yBase = 180

# yAxis = [ yBase,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,yBase]
# xAxis = [ 0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,275]

# yAxis = [ yBase,yBase]
# xAxis = [ 0,275]
# 
# yAxisN = [ yBase,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,yBase]
# xAxisN = [ 0,10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,275]
# 
# yBase = 180

# line = new SVGLayer
# 	width: graphContainer.width
# 	parent: graphContainer
# 	svg: """
# 			<svg viewBox="0 #{-graphContainer.height} #{graphContainer.width} #{graphContainer}" class="chart">
# 			<polyline
# 				fill="rgba(0, 100, 255, 0.5)"
# 				stroke="white"
# 				stroke-width="2"
# 				stroke-linejoin="round"
# 				
# 				"/>
# 			</svg>
# 		"""
 


# points = _.zip(xAxis, yAxis).toString()
# polyline = line.svg.children[0]
# polyline.setAttribute("points", points)


# path = line.elements.shape

# toggle.onTap ->
# 	points = _.zip(xAxisN, yAxisN).toString()
# 	polyline.setAttribute("points", points)
# 	polyline.animate
# 		point: 10
# 		rotation: 10


# 				points=
# 					"
# 					0,#{yBase} 
# 					275,#{yBase} 
# 					"
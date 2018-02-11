spacer = 20

graphContainer = new Layer
	width: Screen.width - 100
	height: 200
	x: Align.center()
	y: Align.bottom(-spacer*2)
	clip: true
	backgroundColor: 'rgba(255,255,255,0.15)'
	

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
	width: 100
	height: 100
	y: Align.top(spacer)
	x: Align.center()


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

dude = 200


roger = 
	"""
		0,#{graphContainer.height - spacer}
		40,#{graphContainer.height - spacer} 
		70,#{graphContainer.height - spacer}
		#{graphContainer.width}, #{graphContainer.height - spacer}
	"""

poop = new SVGLayer
	width: graphContainer.width
	parent: graphContainer
	svg: 
		"""
			<svg viewBox="0 #{-graphContainer.height} #{graphContainer.width} #{graphContainer}" class="chart">
				<polyline
					fill="rgba(255, 255, 255, 0.15)"
					stroke="white"
					stroke-width="2"
					stroke-linejoin="round"
					width="100"
					points="#{roger}"
					"/>
			</svg>
		"""
	fill: "#0AF"


path = poop.elements.shape
# 
# path.strokeWidth = 10
# path.stroke = "#0AF"

# line.states =
# 	toggled:
# 		stroke: 'green'
# 
# toggle.onTap ->
# 	line.stateCycle()
	


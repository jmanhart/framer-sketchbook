trigger = new Layer
	width: Screen.width
	height: 50
	y: Align.bottom()
	backgroundColor: "#55CCFF"
	
	

deep = "#237EAC"
light = "#11A9ED"
awake = "#DF6ECD"
rem = "#793EAC"

lightHeight = 10
deepHeight = 30
awakeHeight = 50
remHeight = 70

graphWidth = Screen.width * 0.9

data = [
	light,
	deep,
	awake,
	rem,
]


graph = new Layer
	y: Align.center()
	x: Align.center()
	width: graphWidth
	height: 100


#defaine x axis


renderGraph = () ->
	
	graphPoints = 10
	
	dude = Utils.randomChoice([light, deep, awake, rem])
	
	
	graphData = [
		light,
		deep,
		awake,
		rem,
	]
	
	# Light Sleep
	if graphItem.name == "#11A9ED"
		graphItem.height = lightHeight
	
	# Deep Sleep
	if graphItem.name == "#237EAC"
		graphItem.height = deepHeight
		
	# Awake Sleep
	if graphItem.name == "#DF6ECD"
		graphItem.height = awakeHeight
		
	# REM Sleep
	if graphItem.name == "#793EAC"
		graphItem.height = remHeight





for i in [0...data.length]
	graphItem = new Layer
		name: data[i]
		parent: graph
		backgroundColor: data[i]
		height: 50
		width: 40
		y: Align.bottom()
		x: 40 * i
		
	renderGraph()

# graphHeight = () ->
# 	if graphItem.backgroundColor = 'green'
# 		graphItem.height = 60
# 	if graphItem.backgroundColor = 'red'
# 		graphItem.height = 10
# 		
# 		
# graphHeight()

graphBox = new Layer
	x: Align.center()
	y: Align.center()
	width: Screen.width
	height: 300


data = [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28]
previous = [0,2,4,6,8,10,12,14,16,18,20,22,24,26,28]


xAxis = []
xAmounts = []
yAxis = []
yAmounts = []
xPadding = 14


# Define horizontal axis
for x in [0..data.length]
	xAmounts.push(x)
	xPoints = Utils.modulate(x, [0, 31], [0, graphBox.width + xPadding])
	xAxis.push(xPoints)


# Add start and end values for fill to render correctly
xAxis.unshift("-1000") 
yAxis.unshift("#{graphBox.height * 2}") 
xAxis.push("#{graphBox * 2}") 
yAxis.push("#{graphBox.height * 2}") 

line = new SVGLayer
	width: graphBox.width
	height: graphBox.height
	parent: graphBox
	svg: """
		<svg viewBox="0 #{-graphBox.height} #{graphBox.width} #{graphBox.height}" class="chart">
			<polyline
				fill="rgba(0, 100, 255, 0.15)"
				stroke="#0AF"
				stroke-width="4"
				stroke-linejoin="round"
				"/>
		</svg>
	"""
	
	
# Render graph
render = ->
	points = _.zip(xAxis, yAxis).toString()
	polyline = line.svg.children[0]
	polyline.setAttribute("points", points)

render()
line = new SVGLayer
	svg: """ 
	<svg width="284" height="90">
		<path d="M 0 30 L 48 0 L 129 30 L 180 30 L 212 30 L 284 30" id="id_PlR_3BPXp" />
	</svg>
	"""
	fill: "yellow"
	stroke: "#0AF"
	strokeWidth: 8
	x: Align.center()
	y: Align.center()
	width: 284



path = line.elements.shape

trig.onTap ->
	
# 	line.animate
# 		path: 10

# line.svg = linePath
# 
# path = line.elements.shape
# 
# line.strokeWidth = 10
# linePath.svg = line




# pointz = [
# 	{0,40}
# 	{40,40}
# 	{40,80}
# 	{80,80}
# ]
# 
# 
# svg = new SVGLayer
# 	svg: """
# 	<svg>			
# 		<polyline
# 			fill="rgba(0, 100, 255, 0.5)"
# 			stroke="white"
# 			stroke-width="2"
# 			stroke-linejoin="round"
# 			points="0,40 40,40 40,80 80,80 80,120 120,120 120,160"
# 			"/>
# 	</svg>
# 	"""
# 	fill: null
# 	stroke: 30
# 	x: Align.center()
# 	y: Align.center()
#  	
# path = svg.elements.shape


# print svg.elements
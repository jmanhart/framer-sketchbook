
spacer= 20

# Watch Frame
layer = new Layer
	width: 156
	height: 196
	backgroundColor:'#1A1A1A'
	x: Align.center()
	y: Align.center()
	

timeMain = new TextLayer
	parent: layer	
	fontSize: 32
	x: Align.center()
	y: Align.center(-spacer)
	color: 'white'
	text: "1:30"

timeSub = new TextLayer
	parent: layer	
	fontSize: 18
	x: Align.center()
	y: Align.center(spacer/2)
	color: 'rgba(255, 255, 255, 0.4)'
	text: "Bloom"

button = new Layer
	parent: layer	
	width: layer.width-(spacer*2)
	height: 44
	x: Align.center()
	y: Align.bottom(-spacer)
	backgroundColor: 'green'
	borderRadius: 8
	
buttonString = new TextLayer
	parent: button	
	x:Align.center()
	y: Align.center()
	fontSize: 18
	color: 'white'

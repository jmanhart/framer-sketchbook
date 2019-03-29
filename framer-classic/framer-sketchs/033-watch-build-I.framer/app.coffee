# Apple Colors
ruby = 'rgba(250,17,79,1)'
red = 'rgba(255,59,48,1)'
orange = 'rgba(255,149,0,1)'
yellow = 'rgba(255,230,32,1)'
green = 'rgba(4,222,113,1)'
mint = 'rgba(0,245,234,1)'
teal = 'rgba(90,200,250,1)' 
blue = 'rgba(32,148,250,1)'
violet = 'rgba(120,122,255,1)'
light = 'rgba(242,244,255,1)'



 

spacer = 20
fpoColor = 'rgba(255,255,255,0.0)'

safeArea = new Layer
	height: Screen.height - (spacer/2)
	width: Screen.width - (spacer/3)
	x: Align.center()
	y: Align.center()
	opacity: 1
	backgroundColor: fpoColor

safeContent = new Layer
	parent: safeArea
	y: Align.bottom()
	x: Align.center()
	width: safeArea.width
	height: safeArea.height - 24
	backgroundColor: fpoColor

time = new TextLayer
	parent: safeArea
	text: '10:09'
	x: Align.right()
	y: Align.top()
	fontSize: 14
	color: light

chevronHeight = 6
chevronWidth = 6
chevronStrokeWidth = 1
chevronColor = light

backChevron = new Layer
	parent: safeArea
	width: chevronWidth
	height: chevronHeight
	x: Align.left(3)
	y: Align.top(6)
	rotation: 135
	backgroundColor: null
	shadow1: 
		x: chevronStrokeWidth
		y: chevronStrokeWidth
		color: chevronColor

pageTitle = new TextLayer
	parent: safeArea
	text: 'Settings'
	x: Align.left(9)
	y: Align.top()
	fontSize: 14
	color: yellow






btnHeight = 35
btnWidth = safeArea.width
btnInActive = mint
btnActive = mint
btnBorderRadius = 4
btnLabelFontSize = 11


dude = (alpha) -> 'rgba(242,244,255,#{alpha})'

btn = new Layer
	parent: safeArea
	height: btnHeight
	width: btnWidth 
	backgroundColor: dude(1)
	borderRadius: btnBorderRadius
	x: Align.center()
	y: Align.bottom(-spacer)

btnLabel = new TextLayer
	parent: btn
	fontSize: btnLabelFontSize
	x: Align.center()
	y: Align.center()
	color: mint
	
btn.states =
	tapped: 
		backgroundColor: btnActive
		
btn.animationOptions =
	curve: Spring(damping: 10)

btn.onTapStart ->
	btn.stateCycle()
	
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
	color: 'white'
	
pageTitle = new TextLayer
	parent: safeArea
	text: 'Settings'
	x: Align.left()
	y: Align.top()
	fontSize: 14
	color: 'rgba(255,255,255,0.5)'

btnHeight = 35
btnWidth = safeArea.width
btnInActive = 'rgba(121, 85, 240, 0.5)'
btnActive = 'rgba(121, 85, 240, 1)'
btnBorderRadius = 4
btnLabelFontSize = 11


btn = new Layer
	parent: safeArea
	height: btnHeight
	width: btnWidth 
	backgroundColor: btnInActive
	borderRadius: btnBorderRadius
	x: Align.center()
	y: Align.bottom(-spacer)

btnLabel = new TextLayer
	parent: btn
	fontSize: btnLabelFontSize
	x: Align.center()
	y: Align.center()
	color: 'rgba(255,255,255,1)'
	
btn.states =
	tapped: 
		backgroundColor: btnActive
		
btn.animationOptions =
	curve: Spring(damping: 10)

btn.onTapStart ->
	btn.stateCycle()
	
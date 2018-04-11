spacer = 20

safeArea = new Layer
	height: Screen.height - (spacer/2)
	width: Screen.width - (spacer/2)
	x: Align.center()
	y: Align.center()
	opacity: 1
	backgroundColor: null
	

btnHeight = 35
btnWidth = safeArea.width
btnInActive = 'rgba(121, 85, 240, 0.5)'
btnActive = 'rgba(121, 85, 240, 1)'
btnBorderRadius = 4
btnLabelFontSize = 9


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
	
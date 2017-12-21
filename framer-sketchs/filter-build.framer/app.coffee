bkg = new BackgroundLayer
	backgroundColor: '#ffffff'

spacer = 20

labelLarge = 28
labelMedium = 20

filterMenuHeight = 300


trigger = new Layer
	y: Align.bottom()
	height: 80
	width: Screen.width
	backgroundColor: 'green'

overLay = new Layer
	size: Screen.size
	backgroundColor: 'rgba(0,0,0,0.6)'
	opacity: 1

filterMenu = new Layer
	parent: overLay
	width: Screen.width
	height: filterMenuHeight
	backgroundColor: 'rgba(255, 255, 255, 1)'
	shadowY: 4
	shadowColor: 'rgba(0,0,0,0.2)'
	shadowBlur: 8
# 	y:Align.top(-filterMenuHeight)
	y:Align.top(0)

filterClose = new Layer
	parent: filterMenu
	size: 50
	x: Align.right(-spacer)
	y: Align.top(spacer)
	backgroundColor: null

icon_close.parent = filterClose
icon_close.x = Align.center()
icon_close.y = Align.center()

filterInfo = new Layer
	parent: filterMenu
	y: Align.top(spacer*4)
	width: Screen.width
	height: (labelLarge + labelMedium + (spacer))
# 	backgroundColor: null

filterTitle = new TextLayer
	parent: filterInfo
	text: "Groceries"
	fontSize: labelLarge
	x: Align.left(spacer)
	y: Align.top()
	color:'black'
	
filterSub = new TextLayer
	parent: filterInfo
	text: "Move To"
	fontSize: labelMedium
	x: Align.left(spacer)
	y: Align.top(filterTitle.fontSize + (spacer/2))
	
filterMenu.states = 
	a:
		y:Align.top(0)

overLay.states = 
	a:
		opacity: 1
		
overLay.animationOptions =
	time: 0.2

filterMenu.animationOptions =
	curve: Bezier.easeInOut
	time: .3

do(filterMenu, overLay) ->
	trigger.onTap ->
		filterMenu.stateCycle()
		overLay.stateCycle()
		
do(filterClose) ->
	filterClose.onTap ->
		filterMenu.stateCycle()
		overLay.stateCycle()

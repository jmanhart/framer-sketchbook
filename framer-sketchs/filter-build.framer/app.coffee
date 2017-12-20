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
	opacity: 0

filterMenu = new Layer
	parent: overLay
	width: Screen.width
	height: filterMenuHeight
	backgroundColor: 'rgba(255, 255, 255, 1)'
	shadowY: 4
	shadowColor: 'rgba(0,0,0,0.2)'
	shadowBlur: 8
	y:Align.top(-filterMenuHeight)
# 	y:Align.top(0)

filterClose = new Layer
	parent: filterMenu
	size: 50
	x: Align.right(-spacer)
	y: Align.top(spacer)

icon_close.parent = filterClose
icon_close.x = Align.center()
icon_close.yy = Align.center()

filterInfo = new Layer
	parent: filterMenu
	y: Align.top(spacer*4)
	width: Screen.width
	height: (labelLarge + labelMedium + (spacer*2))

	
filterTitle = new TextLayer
	parent: filterInfo
	text: "Filter Catagory"
	fontSize: labelLarge
	x: Align.left(spacer)
	y: Align.top()
	
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

do(filterMenu, overLay) ->
	trigger.onTap ->
		filterMenu.stateCycle()
		overLay.stateCycle()
		
do(filterClose) ->
	filterClose.onTap ->
		filterMenu.stateCycle()
		overLay.stateCycle()

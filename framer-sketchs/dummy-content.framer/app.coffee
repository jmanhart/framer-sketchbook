screenColor = new BackgroundLayer
	backgroundColor: 'white'

spacer = 30
copyWidthLimit = 200

copyColor = 'rgba(0,0,0,0.15)'

rowContainer = new Layer
	width: Screen.width
	height: 150

# rowCopyContiainer = new Layer
	
title = new Layer
	parent: rowContainer
	height: 18
	width: Utils.randomNumber(150, 275)
	x: Align.left(spacer)
	y: Align.center(-(spacer*0.6))
	backgroundColor: copyColor

subTitleLineOne = new Layer
	parent: rowContainer
	height: 10
	width: Utils.randomNumber((copyWidthLimit-10), copyWidthLimit)
	x: Align.left(spacer)
	y: Align.center((spacer*0.4))
	backgroundColor: copyColor
	
subTitleLineTwo = new Layer
	parent: rowContainer
	height: 10
	width: Utils.randomNumber((copyWidthLimit-50), copyWidthLimit)
	x: Align.left(spacer)
	y: Align.center((spacer*1))
	backgroundColor: copyColor
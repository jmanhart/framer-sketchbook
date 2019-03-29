bkg = new BackgroundLayer
	backgroundColor: "#E3E3E3"
	
spacer = 20
	
textLink = new TextLayer
	text: "Download PDF"
	fontSize: 20
	x: Align.center(-59)
	y: Align.top(200)

modal = new Layer
	x: Align.center(14)
	y: Align.top(textLink.y + textLink.fontSize + spacer)
	backgroundColor: "white"
	width: 275
	height: 175
	
modalArrow = new Layer
	parent: modal
	x: Align.left(25)
	y: Align.top(-5)
	rotation: 45
	backgroundColor: "white"
	size: 22
	
modalCopy = new TextLayer
	parent: modal
	text: "This is awesome copy and very nice, and super cool awesome sweet yes."
	fontSize: 16
	x: Align.left(spacer)
	y: Align.top(spacer)
	width: modal.width - (spacer*2)
	
modalButton = new Layer
	parent: modal
	height: 44
	width: 160
	y: Align.bottom(-spacer)
	x: Align.left(spacer)
	backgroundColor: "#57A0FF"
	borderRadius: 3
	
modalButtonLabel = new TextLayer
	parent: modalButton
	fontSize: 16
	text: "Download"
	color: "white"
	x: Align.center()
	y: Align.center()
	
	
	
	
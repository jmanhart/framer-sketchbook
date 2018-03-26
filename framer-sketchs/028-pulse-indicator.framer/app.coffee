bkg = new BackgroundLayer
	backgroundColor: "#E9EBEE"

spacer = 25
displayPhotoDim = 50
displayPhotoIndicatorWidth = 2
displayPhotoIndicatorBackgroundColor = '#6EE770'



cardWrapper = new Layer
	y: Align.center()
	x: Align.center()
	width: Screen.width - spacer
	height: displayPhotoDim * 3
	backgroundColor: 'white'
	borderRadius: 3
	borderWidth: 1
	borderColor: '#DDDFE2'
	
cardDisplayPhotoIndicator = new Layer
	parent: cardWrapper
	height: displayPhotoDim * 1.25
	width: displayPhotoDim * 1.25
	borderRadius: displayPhotoDim
	y: Align.center()
	x: Align.left(spacer)
	backgroundColor: null
	borderWidth: displayPhotoIndicatorWidth
	borderColor: displayPhotoIndicatorBackgroundColor
	
cardDisplayPhoto = new Layer
	parent: cardDisplayPhotoIndicator
	height: displayPhotoDim
	width: displayPhotoDim
	borderRadius: displayPhotoDim
	# Must offset border width
	y: Align.center(displayPhotoIndicatorWidth)
	x: Align.center(displayPhotoIndicatorWidth)
	image: 'images/brad.jpg'
	
	
	
mouseOverAnimation = new Animation cardDisplayPhotoIndicator,
	scale: 1.2

mouseOutAnimation = new Animation cardDisplayPhotoIndicator,
	scale: 1	

cardWrapper.onMouseOver ->
	print "Hello"
	mouseOverAnimation.start()
	
cardWrapper.onMouseOut ->
	print "Good-Bye"
	mouseOutAnimation.start()
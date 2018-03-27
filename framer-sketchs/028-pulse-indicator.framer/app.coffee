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
	height: displayPhotoDim * 2.5
	backgroundColor: 'white'
	borderRadius: 3
	borderWidth: displayPhotoIndicatorWidth
	borderColor: '#DDDFE2'
	
cardDisplayPhotoIndicator = new Layer
	parent: cardWrapper
	height: displayPhotoDim
	width: displayPhotoDim
	borderRadius: displayPhotoDim
	y: Align.center()
	x: Align.left(spacer*1.25)
	backgroundColor: null
	borderWidth: displayPhotoIndicatorWidth
	borderColor: displayPhotoIndicatorBackgroundColor
	
cardDisplayPhoto = new Layer
	parent: cardWrapper
	height: displayPhotoDim
	width: displayPhotoDim
	borderRadius: displayPhotoDim
	# Must offset border width
	y: Align.center()
	x: Align.left(spacer*1.25)
	image: 'images/brad.jpg'
	
	
# Setting up the animation blocks
fadeIn = new Animation cardDisplayPhotoIndicator,
	scale: 1.25
	opacity: 1
	options:
		curve: Bezier.easeInOut
		time: 1

fadeDestroy = new Animation cardDisplayPhotoIndicator,
	opacity: 0

# On Mouse Enter 
cardWrapper.onMouseEnter ->
	fadeIn.start()
		
fadeIn.on Events.AnimationEnd, ->
	fadeDestroy.start()
	
fadeDestroy.on Events.AnimationEnd, ->
	fadeIn.reset()
	fadeIn.restart()
	
# On Mouse Out Animation Block
cardWrapper.onMouseOut ->
	fadeIn.reset()
	fadeIn.stop()
bkg = new BackgroundLayer
	backgroundColor: '#121212'

currentAnimationTime = 0
centerY = 75

dot = new Layer
	size: 30
	borderRadius: 30
	x: Align.center()
	y: Align.center()
	backgroundColor: 'white'
	
	
wave = new Animation dot,
	y: centerY + Math.sin(currentAnimationTime)
	

wave.start()
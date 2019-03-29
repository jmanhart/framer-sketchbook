standardBar = require "statusBars"

bkg = new BackgroundLayer
	backgroundColor: '#888'

phoneFrame = new Layer
	y: Align.bottom()
	x: Align.center()
	width: 375
	height: 667
	backgroundColor: 'white'
	
iOSBar = new standardBar.standardBar
	parent: phoneFrame
	barType: "light" # Bar Kind - light or dark
	chargePercent: 66 # Options - 1 – 100
	signalStrength: "ok" # Options - perfect, good, ok, bad

# barHeight = [ 4.5, 6, 8, 10]
# 
# signalContainer = new Layer
# 	width: 15
# 	height: 10
# 	backgroundColor: 'pink'
# 
# for i in [0...4]
# 	bar = new Layer
# 		parent: signalContainer
# 		width: 3
# 		height: barHeight[i]
# 		backgroundColor: 'white'
# 		borderRadius: 0.75
# 		x: Align.left((3 + 1) * i)
# 		y: Align.bottom()


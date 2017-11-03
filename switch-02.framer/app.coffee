

knobSize = 65
knobMargin = knobSize/7
knobAnimation = 0.5

switchWidth = (knobSize*2.05)+knobMargin
#Dark Color
onColor = "#79CEFC"
offColor = "#DDEEF7"

bkg = new BackgroundLayer
	backgroundColor: "#F4F5F6"
	

switchContainer = new Layer
	x: Align.center()
	y: Align.center()
	height: knobSize + knobMargin
	width: switchWidth
	borderRadius: knobSize
	backgroundColor: offColor
	shadowY: 1
	shadowSpread: 10
	shadowBlur: 10
	shadowColor: 'rgba(0,0,0,0.01)'
	shadowType: 'inner'
	
switchKnob = new Layer
	parent: switchContainer
	size: knobSize
	x: Align.left(knobMargin/2)
	y: Align.center()
	borderRadius: knobSize
	backgroundColor: "white"
	shadowY: 1
	shadowSpread: 0
	shadowBlur: 2
	shadowColor: 'rgba(0,0,0,0.2)'
	shadowType: 'outer'

switchKnobIndy = new Layer
	parent: switchContainer
	size: knobSize
	x: Align.right(-knobMargin/2)
	y: Align.center()
	borderRadius: knobSize
	backgroundColor: null

on_mark.parent = switchKnobIndy
on_mark.x = Align.center()
on_mark.y = Align.center()
on_mark.opacity = 0
on_mark.rotation = 90

off_mark.parent = switchKnobIndy
off_mark.x = Align.center()
off_mark.y = Align.center()
off_mark.opacity = 1


switchKnob.states =
	one:
		x: Align.right(-knobMargin/2)

switchKnobIndy.states =
	one:
		x: Align.left(knobMargin/2)
		
on_mark.states =
	one:
		opacity: 1
		rotation: 0
		
off_mark.states =
	one:
		opacity: 0
		rotation: -90


switchContainer.states =
	one: 
		backgroundColor: onColor



switchKnob.animationOptions =
	curve: Spring(damping: 0.95)
	time: knobAnimation
	
switchKnobIndy.animationOptions =
	curve: Spring(damping: 0.95)
	time: knobAnimation

switchContainer.animationOptions =
	curve: Spring(damping: 0.95)
	time: knobAnimation

on_mark.animationOptions = switchKnobIndy.animationOptions
off_mark.animationOptions = switchKnobIndy.animationOptions
	
switchKnob.onTap ->
	switchKnob.stateCycle()
	switchKnobIndy.stateCycle()
	on_mark.stateCycle()
	off_mark.stateCycle()
	switchContainer.stateCycle()

	
switchKnobIndy.sendToBack()
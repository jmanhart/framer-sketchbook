bkg = new BackgroundLayer
	backgroundColor: '#DDDDDD'



menu = new Layer
	width: Screen.width
	height: 300
	y: Align.bottom(240)
	backgroundColor: 'white'
	shadowY: -2
	shadowColor: 'rgba(0,0,0,0.05)'
	shadowBlur: 10

label = new TextLayer
	parent: menu
	x: Align.center()
	y: Align.top(20)
	fontSize: 14
	
	text: "Tap Here Dummy!"

menuUp = new Animation menu,
	y: Align.bottom(0)
	options:
# 		curve: Spring(tension: 150)
		curve: Bezier(0.25, 0.1, 0.25, 1)
# 		curve: steps(1, start)


	
menuDown = new Animation menu,
	y: Align.bottom(240)
	options:
		curve: Spring(tension: 125, friction: 25)


menu.onTap ->
	menuUp.start()
	
menuUp.onAnimationEnd ->
	Utils.delay 0.08, ->
		menuDown.start()
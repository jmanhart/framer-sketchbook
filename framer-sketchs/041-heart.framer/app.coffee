red = "#E60000"
lightred= "##FFBDBD"

bkg = new BackgroundLayer
	backgroundColor: '#E8E8E8'

bkg.states =
	clicked:
		backgroundColor: lightred

mod = Utils.randomNumber(70, 90)

container = new Layer
	x: Align.center()
	y: Align.center()
	backgroundColor: null


btn.y = Align.center()
btn.x = Align.center()
btn.bringToFront()



heartFill.states =
	clicked:
		backgroundColor:red
		
heartStroke.states =
	clicked:
		strokeColor: red

btn.states =
	clicked:
		scale: 1.1
		options: 
			time: 0.5

btn.animationOptions =
	curve: Spring(damping: 0.5)

heartStroke.animationOptions = btn.animationOptions
heartFill.animationOptions = btn.animationOptions


btn.onTap ->
	
	Utils.delay 5, ->
	dots = []
	
	btn.stateCycle()
	heartFill.stateCycle()
	heartStroke.stateCycle()

	
	for i in [0...25]
		dot = new Layer
			parent: container
			x: Align.center()
			y: Align.center()
			height: 4
			width: 4
			rotation: 45
			borderRadius: 100
			backgroundColor:'red'
			
		dot.placeBehind(container)

		dots.push(dot)
	
		for dot, i in dots
			dot.animate
				properties:
					y: Utils.randomNumber(dot.y - mod, dot.y + mod)
					x: Utils.randomNumber(dot.x - mod, dot.x + mod)
				curve: "spring(100, 30, 10)"
			dot.animate
				delay: 0.35
				time: .35
				properties:
					opacity: 1
					scale: 0
				

		
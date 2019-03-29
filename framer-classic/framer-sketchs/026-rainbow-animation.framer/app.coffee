# bkg = new BackgroundLayer
# 	backgroundColor: 'green'

animationBox.y = Align.center(75)
animationBox.x = Align.center()
# 
# clip = new Layer
# 	
# 
# animationA = new Animation one,
# 	rotation: 180
# 	options:
# 		curve: Spring(tension: 250, friction: 25)


rotationAngle = 360
rotationTime = 
rotationRepeat = 5

animationTime = [
	2.50,
	2.25,
	2.00,
	1.75,
	1.50,
	1.25,
	1.00
]


animationBox.onTap ->
	r.animate
		rotation: rotationAngle
		options:
			time: animationTime[0]
			delay: 0.25
			repeat: rotationRepeat
	o.animate
		rotation: rotationAngle
		options:
			time: animationTime[1]
			delay: 0.5
			repeat: rotationRepeat
	y.animate
		rotation: rotationAngle
		options:
			time: animationTime[2]
			delay: 0.75
			repeat: rotationRepeat
			
	g.animate
		rotation: rotationAngle
		options:
			time: animationTime[3]
			delay: 1.00
			repeat: rotationRepeat
	
	b.animate
		rotation: rotationAngle
		options:
			time: animationTime[4]
			delay: 1.25
			repeat: rotationRepeat
		
	i.animate
		rotation: rotationAngle
		options:
			time: animationTime[5]
			delay: 1.5
			repeat: rotationRepeat
	
	v.animate
		rotation: rotationAngle
		options:
			time: animationTime[6]
			delay: 1.75
			repeat: rotationRepeat
		
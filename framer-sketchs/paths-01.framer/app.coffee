title = "Simple tutorial to path animation in Framer"
author = "Ro"

# Default animation
Framer.Defaults.Animation =
	time: 3
	curve: Bezier.linear
	
# A way to use path for animation. You also can hide your path.
path = Layer.select("rect-path").path

# Or use your own one line svg.
# shape = new SVGLayer
# 	svg: "<svg><path d='M0 0 H 200 V 200 H 0 L 0 0' />"
#  
# layer.animate
# 	point: shape.path

# Coordinates of start point
moveX = move.x
moveY = move.y

# Initial animation. You can animate all parameters depends on the coordinates.
move.animate
	rotationZ: path

# Animation on start 
move.onTap ->
	move.animate
		point: path
		
# Back to start 
# move.onAnimationEnd ->
# 	Utils.delay 0.5, ->
# 		move.animate
# 			x: moveX
# 			y: moveY
# 			rotationZ: path
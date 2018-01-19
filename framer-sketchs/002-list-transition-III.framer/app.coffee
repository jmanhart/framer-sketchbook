# @steveruizok


Screen.backgroundColor = "#DDDDDD"

# Four texts of different lengths
# texts = [
# 	'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 
# 	'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 
# 	'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
# 	'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.']

scroll = new ScrollComponent
	size: Screen.size
	scrollHorizontal: false
	backgroundColor: null

for i in [0..6]
	layer = new Layer
		name: 'List Layer ' + i
		parent: scroll.content
		x: Align.center, y: (80 * i)
		height: 64, width: Screen.width
		animationOptions: {time: .25}
		clip: true
		backgroundColor: '#F3F3F3'
	
	layer.title = new TextLayer
		name: '.', parent: layer
		x: 16, y: 4
		fontSize: 22, fontWeight: 600, text: 'List Item ' + i
		color: '#333', width: 250
		animationOptions: {time: .25}
		
	layer.iconArrow = new Layer
		name: '.', parent: layer
		x: Align.right(-8), y: 4
		width: 32, height: 32
		backgroundColor: 'green'
		rotation: 180
		animationOptions: {time: .25}
	
	layer.expanded = false
	
	
	layer.iconArrow.onTap ->
		scrollz(@parent.y) 
		toggleExpand(@parent, 300 )


scrollz = (top) ->
	scroll.scrollToPoint(
		x: 0, y: top
	)

	
toggleExpand = (layer, distance, top) ->
	distance = if layer.expanded is false then distance else -distance
	iconRotation = if layer.expanded is false then 0 else 180
# 	scrollTop = if layer.expanded is false then 0
	
	delay = 0
	
# 	for sib in layer.siblings
# 		if sib.expanded is true
# 			toggleExpand(sib, 100)
	
	Utils.delay delay, ->
	
		layer.animate
			height: layer.height + distance
			
		for sib in layer.siblings
			if sib.y > layer.y
				sib.animate
					y: sib.y + distance

							
		layer.expanded = !layer.expanded
	
		Utils.delay .3 + delay, -> scroll.updateContent()
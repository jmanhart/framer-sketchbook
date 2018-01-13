
tabs =[]

for i in [0...3]
	tab = new Layer
		height: 40
		width: 100
		x: Align.left(40+(150 * i))
		y: Align.center()
		backgroundColor: 'blue'
	
	tab.states =
		active:
			backgroundColor:'green'
		disabled:
			backgroundColor: 'blue'
				
	tabs.push tab
	
	do(tab) ->
		tab.onTap ->
			tab.stateCycle()
			
			for dude, i in tabs
				if tab.states.current.name is "active"
					print "on"
					
				if tab.states.current.name is "disabled"
					print "off"
	
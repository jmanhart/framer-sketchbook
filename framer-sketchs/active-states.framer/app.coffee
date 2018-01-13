

rows = []
# 
# dude = rows

for i in [0...3]
	row = new Layer
		name: 'row ' + i
		y: i * 50
		height: 50
		width: Screen.width
	
	row.rightButton = new Layer
		name: 'Right Button'
		parent: row
		height: row.height
		width: 100
		x: Align.right(100)
		backgroundColor: "red"
		
	row.leftButton = new Layer
		name: 'Left Button'
		parent: row
		height: row.height
		width: 100
		x: Align.left()
		
	row.states =
		active:
			x: -100
						
	rows.push row
	
	row.active = false
	
	do(row)->
		row.leftButton.onTap -> 
			row.active = true
			stateToggle()
			
	do(row)->
		row.rightButton.onTap -> 
			row.active = false
			stateToggle()
		
					
	stateToggle = () ->
		for row in rows
			if row.active is true 
				row.stateCycle()
			else
				row.active = false
				row.stateCycle("default")
					
			
			
			
# 	stateToggle = () ->


	
	
	
	
	
	
	
	
	
	
	
	
# 	do(row)->
# 		row.leftButton.onTap -> 
# 			if row.active is true 
# 				row.stateCycle("active")
# 			if row.active is false
# 				row.stateCycle("inactive")



# 	isRowActive = () ->
# 		if row.active is true 
# 			row.stateCycle("active")
# 		else 
# 			row.stateCycle("active")



# 	row.leftButton.onTap -> rowActive(@layer, @state)


# active = if row.active is true then print "active bro!"
	
# rowActive = (active, stateCycle) ->
# 	active = if row.active is true then print "active bro!"
# 	
# 	stateCycle = 
# 		if row.active is true 
# 			row.stateCycle("active")
# 		else 
# 			row.stateCycle("inactive")





	
# 	do(row) ->
# 		row.leftButton.onTap ->
# 			row.stateCycle("active")

# leftButton.onTap ->
# 	row.stateCycle("active")
# 		
# do(rows) ->
# 	rightButton.onTap ->
# 		rows.stateCycle("default")


# print rows
# print dude